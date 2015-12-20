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
          "I love #{place.describe} because its so #{place.aspects.sample.label}"
        ]
      end
    end
  end
end
