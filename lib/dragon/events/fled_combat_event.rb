module Dragon
  module Events
    class FledCombatEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "You safely fled from the #{enemy.describe}"
      end
    end
  end
end
