module Dragon
  module Scenes
    class Combat < Scene
      attr_reader :enemy

      def with(enemy: nil)
        @enemy = enemy
        self
      end

      def squelch_narration?
        true
      end

      def describe
        "fighting #{enemy.describe}"
      end

      def actions(_)
        [
          AttackCommand.new(enemy: enemy, player: player),
          FleeCommand.new(enemy: enemy)
        ]
      end
    end
  end
end
