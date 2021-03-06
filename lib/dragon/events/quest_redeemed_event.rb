module Dragon
  module Events
    class QuestRedeemedEvent < Event
      attr_reader :quest

      def initialize(quest: nil)
        @quest = quest
      end

      def describe
        "You gain #{quest.describe_rewards} for completing the quest #{quest.label}"
      end
    end
  end
end
