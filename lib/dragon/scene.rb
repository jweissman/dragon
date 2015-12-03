module Dragon
  class Scene
    extend Forwardable

    attr_reader :engine
    # attr_accessor :last_response, :last_action
    # attr_accessor :last_command, :last_event

    include Dragon::Commands

    def_delegators :engine, :last_command, :last_event
      # :move_to, :transition_to, :initial_scene, :conversation_with, 

    def initialize(engine: nil)
      @engine = engine
    end

    def handle(action: nil, place: nil)
      # @last_command   = action #.describe
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
