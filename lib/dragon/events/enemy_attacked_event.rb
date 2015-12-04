module Dragon
  module Events
    class EnemyAttackedEvent < Event
      attr_accessor :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "#{enemy.describe} attacked!"
      end
    end
  end
end
