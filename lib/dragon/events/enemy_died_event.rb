module Dragon
  module Events
    class EnemyDiedEvent < Event
      attr_accessor :enemy, :xp

      def initialize(enemy: nil, xp: nil)
        @enemy = enemy
        @xp = xp
      end

      def describe
        "#{enemy.describe} was defeated, earning you #{xp} experience"
      end 
    end
  end
end
