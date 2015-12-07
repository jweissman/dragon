module Dragon
  module Questions
    class AskToStart < Question
      attr_reader :activity

      def initialize(activity: nil)
        @activity = activity
        super(topic: activity)
      end

      def describe
        "to start #{activity.describe}"
      end

      def responses
        [ 
          "I'd love #{activity.describe} for you!"
        ]
      end
    end
  end
end
