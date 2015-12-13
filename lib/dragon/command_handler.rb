module Dragon
  class CommandHandler < Struct.new(:engine)
    include Events
    include Scenes
    extend Forwardable

    def_delegator :game, :current_place, :place
    def_delegators :game,
      :previous_scene, :world, :player,
      :transition_to, :travel_to, :move_to, :halt!

    def_delegators :engine, :game

    def handle(command)
      raise "override CommandHandler#handle(command) in subclass"
    end

    def welcome
      Welcome.new(game: game)
    end

    def exploration
      Exploration.new(game: game)
    end

    def conversation_with(partner)
      Conversation.new(game: game).with(partner: partner)
    end

    def combat_with(enemy)
      Combat.new(game: game).with(enemy: enemy)
    end
  end
end
