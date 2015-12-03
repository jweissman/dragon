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
      @world = World.generate
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

        ws.on :open do |event|
          create(ws)
        end

        ws.on :message do |event|
          update(ws, event)
        end

        ws.on :close do |event|
          delete(ws)
        end

        # Return async Rack response
        ws.rack_response
      else
        @app.call(env)
      end
    end

    protected
    def controller
      @controller ||= SessionController.new(multi_user_driver: self)
    end
  end
end
