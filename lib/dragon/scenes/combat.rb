module Dragon
  module Scenes
    class Combat < Scene
      attr_reader :enemy

      def with(enemy: nil)
        @enemy = enemy
        self
      end

      def describe
        "fighting #{enemy.label}"
      end

      def actions(_)
        [
          attack(enemy, player),
          flee(enemy)
        ]
      end
    end
  end
end
