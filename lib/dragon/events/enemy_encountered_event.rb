module Dragon
  module Events
    class EnemyEncounteredEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "you encounter #{enemy.label}"
      end

      def actions
        [ engage(enemy) ]
      end
    end
  end
end
