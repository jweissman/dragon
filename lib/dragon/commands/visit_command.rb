module Dragon
  module Commands
    class VisitCommand < Command
      attr_reader :place, :label

      def initialize(place: nil, label: nil)
        @place = place
        @label = label || "Visit #{place.describe}"
      end

      def label
        @label
      end

      def describe
        "You walk to #{place.describe}"
      end
    end
  end
end
