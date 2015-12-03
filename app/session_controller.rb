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

      session.make_character
    end

    def update(client, event)
      p [:update, event.data]

      parsed_event_data = JSON.parse(event.data)

      active_session = find_active_session_for client 
      active_session.step!(parsed_event_data)
    end

    def delete(client)
      p [:delete]
      destroy_active_session_for client
      client = nil
    end

    protected
    def find_active_session_for(client)
      selector = method(:session_client_is?).curry.(client)
      sessions.find(&selector)
      # do |session|
      #   session.client == client
      # end
    end

    def destroy_active_session_for(client)
      sessions.delete_if do |session| 
        session.client == client
      end
    end

    def session_client_is?(client, session)
      session.client == client
    end
  end
end
