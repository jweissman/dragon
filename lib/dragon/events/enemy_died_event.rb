module Dragon
  module Events
    class EnemyDiedEvent < Event
      attr_reader :enemy, :xp, :gold

      def initialize(enemy: nil, xp: nil, gold: nil)
        @enemy = enemy

        @xp = xp
        @gold = gold
      end

      def describe
        "#{enemy.describe} was defeated, earning you #{xp} experience and #{gold} gold"
      end 
    end
  end
end
