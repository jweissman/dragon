module Dragon
  class Scene
    extend Forwardable

    attr_reader :engine
    attr_accessor :last_response, :last_action

    include Dragon::Commands

    def_delegators :engine, 
      :move_to, :transition_to, :initial_scene, :conversation_with

    def initialize(engine: nil)
      @engine = engine
    end

    def handle(action: nil, place: nil)
      @last_action   = action.describe
      @last_response = respond_to(action, place)

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
