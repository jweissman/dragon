module Dragon
  class Scene
    include Helpers::CommandHelpers
    extend Forwardable

    def_delegators :game, :world, :player
    attr_reader :game

    def initialize(game: nil)
      @game = game
    end

    def show_gold?
      false
    end

    def show_quests?
      false
    end

    def show_items?
      false
    end

    def deep_narration?
      false
    end

    def permit_delays?
      true
    end

    def base_actions
      [ reflect(player) ]
    end

    def narrator
      SceneNarrator.new(self) #, terminal: terminal)
    end
  end
end
