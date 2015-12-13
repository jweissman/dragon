module Dragon
  module Events
    class QuestOfferedEvent < Event
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "The quest you are offered is #{quest.label}"
      end

      def actions
        [
          AcceptQuestCommand.new(quest: quest),
          RejectQuestCommand.new(quest: quest)
        ]
      end
    end
  end
end
