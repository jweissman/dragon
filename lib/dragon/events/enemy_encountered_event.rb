module Dragon
  module Events
    class EnemyEncounteredEvent < Event
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "you encounter #{enemy.describe(prefix: 'a(n)')}"
      end

      def actions
        [
          Dragon::Commands::EngageCombatantCommand.new(enemy: enemy)
        ]
      end
    end
  end
end
