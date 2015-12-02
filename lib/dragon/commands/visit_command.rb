module Dragon
  module Commands
    class VisitCommand < Command
      attr_reader :place

      def initialize(place: nil)
        @place = place
      end

      def label
        "Visit #{place.describe}"
      end

      def describe
        "You walk to #{place.describe}"
      end
    end
  end
end
