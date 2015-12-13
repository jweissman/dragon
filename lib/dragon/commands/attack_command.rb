module Dragon
  module Commands
    class AttackCommand < Command
      attr_reader :player, :enemy

      def initialize(player: nil, enemy: nil)
        @enemy  = enemy
        @player = player

        describe
      end

      def describe
        @description ||= "#{player_description} attack #{enemy_description}"
      end

      def player_description
        "you (#{player.hp}/#{player.max_hp})"
      end

      def enemy_description
        "#{enemy.label} (#{enemy.hp}/#{enemy.max_hp})"
      end

      def label
        "Attack #{enemy.label}"
      end
    end
  end
end
