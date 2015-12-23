module Dragon
  module Commands
    class UpgradeStatisticCommand < Command
      attr_reader :player, :stat_name

      def initialize(player: nil, stat_name: nil)
        @player = player
        @stat_name = stat_name
      end

      def describe
        "Your #{stat_name} is enhanced"
      end

      def label
        "Upgrade #{stat_name}"
      end
    end
  end
end
