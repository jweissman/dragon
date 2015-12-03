module Dragon
  module Events
    class PlayerTravelledToTownEvent < Event
      attr_reader :place

      def initialize(place: nil)
        @place  = place
      end

      def describe
        "You arrive in #{place.name}"
      end
    end
  end
end
