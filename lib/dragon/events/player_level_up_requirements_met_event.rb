module Dragon
  module Events
    class LevelUpRequirementsMetEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "You may advance to level #{player.level+1}"
      end
    end
  end
end
