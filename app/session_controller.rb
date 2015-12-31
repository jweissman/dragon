module Dragon
  class SessionController
    extend Forwardable
    def_delegators :multi_user_driver, :sessions, :world

    attr_reader :multi_user_driver

    def initialize(multi_user_driver: nil)
      @multi_user_driver = multi_user_driver
    end

    def create(client)
      p [:create]
      session = GameSession.new(client: client, world: world)
      sessions.push session
      session.step!
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end

    def update(client, event)
      p [:update, event.data]

      parsed_event_data = JSON.parse(event.data)

      Thread.new do
        active_session = find_active_session_for client
        active_session.step!(parsed_event_data)
      end
    rescue => ex
      puts ex.message
      puts ex.backtrace
    end

    def delete(client)
      p [:delete]
      destroy_active_session_for client
      client = nil
    end

    protected
    def find_active_session_for(client)
      sessions.find { |s| s.client == client }
    end

    def destroy_active_session_for(client)
      sessions.delete_if do |session|
        session.client == client
      end
    end
  end
end
