module Dragon
  module Events
    class CombatEngagedEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "The #{enemy.describe} engages you!"
      end
    end
  end
end
