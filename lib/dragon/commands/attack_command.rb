module Dragon
  module Commands
    class AttackCommand < Command
      attr_reader :player, :enemy

      def initialize(player: nil, enemy: nil)
        @enemy  = enemy
        @player = player

        # TODO add to part of the data of the command obj?
        describe
      end

      def describe
        @description ||= "#{player_description} attack #{enemy_description}!"
      end

      def player_description
        "You (#{player.hp}/#{player.max_hp})"
      end

      def enemy_description
        "#{enemy.describe} (#{enemy.hp}/#{enemy.max_hp})!"
      end

      def label
        "Attack #{enemy.describe}"
      end
    end
  end
end
