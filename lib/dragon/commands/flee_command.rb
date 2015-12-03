module Dragon
  module Commands
    class FleeCommand < Command
      attr_reader :enemy

      def initialize(enemy: nil)
        @enemy = enemy
      end

      def describe
        "You flee from the #{enemy.describe}"
      end

      def label
        "Flee #{enemy.describe}"
      end
    end
  end
end
