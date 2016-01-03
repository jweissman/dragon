module Dragon
  class SessionController
    attr_reader :world

    def initialize(world: nil)
      @world = world
    end

    def create(client)
      p [:create]
      session = GameSession.create(client: client, world: world)
      session.step!
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end

    def update(client, event)
      p [:update, event.data]
      parsed_event_data = JSON.parse(event.data)
      session = GameSession.find_by_client(client)

      Thread.new do
        session.step!(parsed_event_data)
      end
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end

    def delete(client)
      p [:delete]
      GameSession.delete_by_client(client)
      client = nil
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end
  end
end
