module Dragon
  class Scene
    extend Forwardable

    attr_reader :controller
    attr_reader :last_response, :last_action

    def_delegators :controller, 
      :move_to, :transition_to, :initial_scene, :conversation_with

    def initialize(controller: nil)
      @controller = controller
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
      handler = action.class.handler(controller)
      handler.handle(action)
    end
  end
end
