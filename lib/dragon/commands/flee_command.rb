module Dragon
  module Commands
    class FleeCommand < Command
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "You flee from #{enemy.label}"
      end

      def label
        "Flee #{enemy.label}"
      end
    end
  end
end
