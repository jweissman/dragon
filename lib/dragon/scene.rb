module Dragon
  class Scene
    include Dragon::Commands
    extend Forwardable

    def_delegators :engine,
      :player, :last_command, :last_events, :world

    attr_reader :engine

    def initialize(engine: nil)
      @engine = engine
    end

    def handle(action: nil, place: nil)
      engine.last_events = *respond_to(action)
      self
    end

    def squelch_narration?
      false
    end

    def deep_narration?
      false
    end

    def permit_delays?
      true
    end

    def base_actions
      [ ExitGameCommand.new ]
    end

    def event_actions
      last_events.flatten.compact.
        map(&:actions).flatten.compact
    end

    def respond_to(action)
      handler = action.class.handler(engine)
      handler.handle(action)
    end
  end
end
