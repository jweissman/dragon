module Dragon
  module Commands
    class AcceptQuestCommand < Command
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "After considering #{quest.requestor.name}'s request #{quest.label}, you favor it..."
      end

      def label
        "Accept quest #{quest.label}"
      end
    end
  end
end
