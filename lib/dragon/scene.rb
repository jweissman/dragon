module Dragon
  class Scene
    include Dragon::Commands

    extend Forwardable
    def_delegators :engine, :player, :last_command, :last_event

    attr_reader :engine

    def initialize(engine: nil)
      @engine = engine
    end

    def handle(action: nil, place: nil)
      engine.last_event = respond_to(action, place)
      self
    end

    def base_actions
      [ ExitGameCommand.new ]
    end

    def respond_to(action, *args)
      handler = action.class.handler(engine)
      handler.handle(action)
    end
  end
end
