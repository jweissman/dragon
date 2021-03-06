module Dragon
  module Events
    class PlayerDodgedAttackEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "you dodge #{enemy.label}'s attack"
      end
    end
  end
end
