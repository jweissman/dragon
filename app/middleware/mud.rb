require 'faye/websocket'

module Dragon
  class Mud
    extend Forwardable
    def_delegators :controller, :create, :update, :delete
    attr_reader :world, :controller

    KEEPALIVE_TIME = 15 # seconds

    def initialize(app)
      @app = app
      @world = World.new
    end

    def call(env)
      if request_websocket?(env)
        setup_websocket(env)
      else
        @app.call(env)
      end
    end

    protected
    def setup_websocket(env)
      websocket = create_websocket(env)
      bind_websocket(websocket)
      websocket.rack_response
    end

    def bind_websocket(ws)
      ws.on(:open)    { create(ws) }
      ws.on(:message) { |evt| update(ws, evt) }
      ws.on(:close)   { delete(ws) }
    end

    private
    def controller
      @controller ||= SessionController.new(world: world)
    end

    def create_websocket(env)
      Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME})
    end

    def request_websocket?(env)
      Faye::WebSocket.websocket?(env)
    end
  end
end
