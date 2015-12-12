module Dragon
  class GameSession < Driver
    extend Forwardable

    attr_reader :client, :player, :world

    def_delegators :client, :send, :delete
    def_delegators :console, :content, :clear

    def initialize(world: nil, client: nil)
      @client = client
      super(world)
    end

    def step!(data=nil)
      clear

      if data
        message = ClientRequestMessage.new(data)
        handle(message) if message.action_record
      end

      describe
      engine.prompt_player
      send output if output

      @params = {} # clear out params...

      self
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

    protected
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
