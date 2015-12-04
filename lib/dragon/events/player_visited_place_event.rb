module Dragon
  module Events
    class PlayerVisitedPlaceEvent < Event
      attr_reader :place, :player

      def initialize(place: nil, player: nil)
        @place = place
        @player = player
      end

      def describe
        "You visit #{place.describe}"
      end
    end
  end
end
