module Dragon
  module Events
    class CombatEngagedEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "#{enemy.label} engages you"
      end
    end
  end
end
