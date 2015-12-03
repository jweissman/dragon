module Dragon
  module Events
    class PlayerVisitedPlaceEvent < Event
      attr_reader :place

      def initialize(place: nil)
        @place = place
      end

      def describe
        "You visit #{place.describe}"
      end
    end
  end
end
