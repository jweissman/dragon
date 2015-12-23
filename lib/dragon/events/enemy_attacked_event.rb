module Dragon
  module Events
    class EnemyAttackedEvent < Event
      attr_accessor :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "#{enemy.label} attacked with #{enemy.weapon.describe(prefix: 'a')}"
      end
    end
  end
end
