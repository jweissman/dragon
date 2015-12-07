module Dragon
  module Commands
    class RedeemQuestCommand < Command
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "#{quest.requestor.name} gives you #{quest.reward.describe} for quest #{quest.label}"
      end

      def label
        "Redeem quest #{quest.label}"
      end
    end
  end
end
