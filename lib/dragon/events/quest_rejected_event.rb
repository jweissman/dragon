module Dragon
  module Events
    class QuestRejectedEvent < Event
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "You decline the offered quest #{quest.label}"
      end
    end
  end
end
