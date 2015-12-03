module Dragon
  module Commands
    class WanderCommand < Command
      attr_accessor :place

      def initialize(place: nil)
        @place = place
      end

      def label
        "Wander around #{place.describe}"
      end

      def describe
        "You wander around #{place.describe}"
      end
    end
  end
end
