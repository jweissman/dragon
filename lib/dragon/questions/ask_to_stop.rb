module Dragon
  module Questions
    class AskToStop < Question
      attr_reader :activity

      def initialize(activity: nil)
        @activity = activity

        super(topic: activity)
      end

      def describe
        "to stop #{activity.describe}"
      end

      def responses
        [ "Fine, I'll stop #{activity.describe}" ]
      end
    end
  end
end
