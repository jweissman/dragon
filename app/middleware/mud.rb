require 'faye/websocket'

module Dragon
  class Mud
    KEEPALIVE_TIME = 15 # seconds

    def initialize(app)
      @app = app
      @sessions = []
      @world = World.generate
    end

    def new(client)
      session = GameSession.new(client: client, world: @world)
      @sessions << session
      session.make_character
    end

    def update(client, event)
      p [:message, event.data]

      active_session = @sessions.find do |session|
        session.client == client
      end

      parsed_event_data = JSON.parse(event.data)
      active_session.step!(parsed_event_data)
    end

    def delete(client)
      @sessions.delete_if do |session| 
        session.client == client
      end
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

        ws.on :open do |event|
          new(ws)
        end

        ws.on :message do |event|
          update(ws, event)
        end

        ws.on :close do |event|
          delete(ws)
          ws = nil
        end

        # Return async Rack response
        ws.rack_response
      else
        @app.call(env)
      end
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end
  end
end
