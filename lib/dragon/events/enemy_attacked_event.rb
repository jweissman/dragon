module Dragon
  module Events
    class EnemyAttackedEvent < Event
      attr_accessor :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "#{enemy.label} attacked with #{enemy.weapon.label}"
      end
    end
  end
end
