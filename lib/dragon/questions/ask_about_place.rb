module Dragon
  module Questions
    class AskAboutPlace < Question
      attr_reader :place

      def initialize(place: nil)
        @place = place
        super(topic: place)
      end

      def describe
        "about #{place.describe}"
      end

      def responses
        [
          "I love #{place.describe}!",
          "This #{place.describe} is great",
          "So happy about #{place.describe}!"
        ]
      end
    end
  end
end
