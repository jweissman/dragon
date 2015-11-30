module Dragon
  class Scene
    extend Forwardable

    attr_reader :controller
    attr_accessor :last_response

    def_delegators :controller, :move_to, :transition_to, :initial_scene, :conversation_with

    def initialize(controller: nil)
      @controller = controller
    end

    def handle(action: nil, place: nil)
      @last_response = respond_to(action, place)
      self
    end

    def base_actions
      {
        quit: "Leave the realms"
      }
    end

    def respond_to(action, *args)
      if action == :quit
        'Well bye!'
      else
        'Hmm, it did not seem to work!'
      end
    end
  end
end

