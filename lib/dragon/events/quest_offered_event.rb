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
        [ accept_quest(quest), reject_quest(quest) ]
      end
    end
  end
end
