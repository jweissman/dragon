module Dragon
  module Events
    class EnemyDodgedAttackEvent < Event
      attr_accessor :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "#{enemy.describe} dodges swiftly!"
      end
    end
  end
end
