module Dragon
  module Events
    class QuestProgressedEvent < Event
      attr_reader :quest, :cause
      
      def initialize(quest: nil, cause: nil)
        @quest = quest
        @cause = cause
      end

      def describe
        "#{cause}, making progress in your quest #{quest.label}"
      end
    end
  end
end
