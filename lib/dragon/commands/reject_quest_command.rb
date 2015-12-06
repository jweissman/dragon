module Dragon
  module Commands
    class RejectQuestCommand < Command
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "After considering #{quest.requestor.name}'s request #{quest.label}, you don't favor it..."
      end

      def label
        "Reject quest #{quest.label}"
      end
    end
  end
end
