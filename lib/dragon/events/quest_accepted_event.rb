module Dragon
  module Events
    class QuestAcceptedEvent < Event
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "You embark upon the quest #{quest.label}"
      end
    end
  end
end
