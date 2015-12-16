require 'faye/websocket'

module Dragon
  class Mud
    extend Forwardable
    def_delegators :controller, :create, :update, :delete
    attr_reader :sessions, :world, :controller

    KEEPALIVE_TIME = 15 # seconds

    def initialize(app)
      @app = app
      @sessions = []
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
      ws = create_websocket(env)
      ws.on :open    do |_|
        create(ws)
      end

      ws.on :message do |event|
        update(ws, event)
      end

      ws.on :close   do |event|
        delete(ws)
      end

      ws.rack_response
    end

    private
    def controller
      @controller ||= SessionController.new(multi_user_driver: self)
    end

    def create_websocket(env)
      Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME})
    end

    def request_websocket?(env)
      Faye::WebSocket.websocket?(env)
    end
  end
end
