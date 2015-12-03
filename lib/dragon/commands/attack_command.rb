module Dragon
  module Commands
    class AttackCommand < Command
      attr_reader :player, :enemy

      def initialize(player: nil, enemy: nil)
        @enemy = enemy
        @player = player
      end

      def describe
        "You attack #{enemy.describe}"
      end

      def label
        "Attack #{enemy.describe}"
      end
    end
  end
end
