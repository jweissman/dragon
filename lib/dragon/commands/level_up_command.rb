module Dragon
  module Commands
    class LevelUpCommand < Command
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "You advance to level #{player.level+1}"
      end

      def label
        "Advance to level #{player.level+1} (#{player.profession})"
      end
    end
  end
end
