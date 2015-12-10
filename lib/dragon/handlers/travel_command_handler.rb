module Dragon
  module Handlers
    class TravelCommandHandler < CommandHandler
      def handle(command)
        destination = command.destination

        if random_encounter?
          handle_encounter destination
        else
          travel destination
        end
      end

      def travel(destination)
        previous_place = place
        travel_to destination

        [
          PlayerTravelledToTownEvent.new(place: destination),
          PlayerVisitedPlaceEvent.new(place: place, previous_place: previous_place)
        ]
      end

      def handle_encounter(destination)
        previous_place = place
        engine.last_destination = destination

        random_event = RandomEvent.sample(destination, previous_place, "while travelling from #{previous_place.name} to #{destination.name}")

        if random_event.is_a?(PlaceDiscoveredEvent)
          move_to random_event.place
          [ random_event ]
        else
          encounter_area = place.city.areas.sample
          move_to encounter_area
          [
            PlayerVisitedPlaceEvent.new(place: encounter_area, previous_place: previous_place),
            random_event
          ]
        end
      end

      def random_encounter?
        rand <= RANDOM_ENCOUNTER_RATE
      end
    end
  end
end
