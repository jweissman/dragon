module Dragon
  module Events
    class EnemyTookDamageEvent < Event
      attr_reader :enemy, :amount

      def initialize(enemy: nil, amount: nil)
        @enemy = enemy
        @amount = amount
      end

      def describe
        "You struck #{enemy.describe} for #{amount} damage"
      end
    end
  end
end
