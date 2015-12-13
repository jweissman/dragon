module Dragon
  module Events
    class PlayerTookDamageEvent < Event
      attr_reader :enemy, :amount

      def initialize(enemy: nil, amount: nil)
        @enemy = enemy
        @amount = amount
      end
      
      def describe
        "#{enemy.label} struck you for #{amount} damage"
      end
    end
  end
end
