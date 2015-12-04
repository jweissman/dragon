module Dragon
  module Commands
    class AttackCommand < Command
      attr_reader :player, :enemy

      def initialize(player: nil, enemy: nil)
        @enemy = enemy
        @player = player

        # TODO add part of the data of the command obj in retrospect
        describe
      end

      def describe
        @description ||= "You (#{player.hp}/#{player.max_hp}) attack #{enemy.describe}"
      end

      def label
        "Attack #{enemy.describe}"
      end
    end
  end
end
