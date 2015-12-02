module Dragon
  module Commands
    class EgressCommand < Command
      attr_reader :place
      def initialize(place: nil)
        @place = place
      end

      def label
        "Leave #{place.building.describe}"
      end

      def describe
        "You leave the #{place.building.describe}"
      end
    end
  end
end
