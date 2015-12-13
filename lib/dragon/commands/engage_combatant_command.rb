module Dragon
  module Commands
    class EngageCombatantCommand < Command
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def label
        "Engage #{enemy.label}"
      end

      def describe
        "you engage #{enemy.label}"
      end
    end
  end
end
