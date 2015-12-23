module Dragon
  module Events
    class PlaceDiscoveredEvent < Event
      attr_reader :place, :original_destination, :origin, :cause

      def initialize(place: nil, original_destination: nil, origin: nil, cause: "While exploring")
        @place = place
        @original_destination = original_destination
        @origin = origin
      end

      def describe
        "#{cause} you discover #{place.describe}"
      end

      def origin_place
        if origin.is_a?(City)
          origin
        else
          origin.city
        end
      end

      def actions
        action_list = []

        if place.class.can_wander?
          action_list.push(wander_around(place)) 
        end

        if original_destination && original_destination != origin_place

          if original_destination.is_a?(City)
            keep_travelling = travel(original_destination, "Keep travelling to #{original_destination.name}")
            action_list.push(keep_travelling)
          elsif original_destination.is_a?(Area)
            keep_wandering = wander_around(original_destination, "Keep exploring #{original_destination.describe}")
            action_list.push keep_wandering
          end
        end

        action_list.push(travel(origin_place, "Return to #{origin_place.name}"))

        action_list
      end
    end
  end
end
