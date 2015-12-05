module Dragon
  module Events
    class PlayerVisitedPlaceEvent < Event
      attr_reader :place, :player, :previous_place

      def initialize(place: nil, previous_place: nil)
        @place = place
        @player = player
        @previous_place = previous_place
      end

      def describe
        "You visit #{place.describe}"
      end
    end
  end
end
