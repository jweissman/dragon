module Dragon
  module Events
    class FledCombatEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "You safely fled from #{enemy.label}"
      end
    end
  end
end
