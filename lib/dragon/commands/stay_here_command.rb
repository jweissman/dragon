module Dragon
  module Commands
    class StayHereCommand < Command
      attr_reader :place

      def initialize(place: nil)
        @place = place
      end

      def describe
        "You decide to remain in #{place.describe}"
      end

      def label
        "Stay in #{place.describe}"
      end
    end
  end
end
