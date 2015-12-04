module Dragon
  module Commands
    class EngageCombatantCommand < Command
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def label
        "Engage #{enemy.describe}"
      end

      def describe
        "you engage #{enemy.describe}"
      end
    end
  end
end
