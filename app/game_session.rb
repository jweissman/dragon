module Dragon
  class GameSession < Driver
    extend Forwardable

    attr_reader :client, :world

    def_delegators :client, :send, :delete
    def_delegators :console, :content, :clear

    def initialize(world: nil, client: nil)
      @client = client
      super(world)
    end

    def self.all
      @_sessions ||= []
    end

    def self.create(client: nil, world: nil)
      session = new(client: client, world: world)
      all.push(session)
      session
    end

    def self.find_by_client(client)
      all.find { |s| s.client == client }
    end

    def self.delete_by_client(client)
      all.delete find_by_client(client)
    end

    def step!(data=nil)
      clear

      if data
        message = ClientRequestMessage.new(data)
        handle(message) if message.action_record
      end

      describe
      engine.prompt_player
      
      @params = {} # clear out params...
      self
    rescue => ex
      puts ex.message
      puts ex.backtrace
      raise ex
    end

    def handle(message)
      actions = engine.last_prompted_actions

      unless actions.nil?
        action  = actions.detect do |act|
          act.label == message.action
        end

        if action
          message.hydrate(action) if message.params.any?
          engine.react(action)
        end
      end

      self
    end

    def output
      JSON.dump(content: content.join + "</div>") if content
    end

    def console
      @console ||= StreamingVirtualConsole.new(self)
    end

    def first_time?
      @first_time
    end
  end
end
