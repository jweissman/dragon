module Dragon
  module Events

    class QuestCompletedEvent < Event
      attr_reader :quest, :cause

      def initialize(quest: nil, cause: nil)
        @quest = quest
        @cause = cause
      end

      def describe
        "#{cause}, completing your quest #{quest.label}"
      end
    end
  end
end
