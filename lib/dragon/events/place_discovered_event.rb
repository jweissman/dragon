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
        action_list = [
          Dragon::Commands::WanderCommand.new(place: place),
        ]

        if original_destination && original_destination != origin_place

          if original_destination.is_a?(City)
            action_list.push Dragon::Commands::TravelCommand.new(
              destination: original_destination,
              label: "Keep travelling to #{original_destination.name}")

          elsif original_destination.is_a?(Area)
            action_list.push Dragon::Commands::WanderCommand.new(
              place: original_destination,
              label: "Keep exploring #{original_destination.describe}"
            )
          end
        end

        action_list.push(
          Dragon::Commands::TravelCommand.new(
            destination: origin_place, 
            label: "Return to #{origin_place.name}"
          )
        )

        action_list
      end
    end
  end
end