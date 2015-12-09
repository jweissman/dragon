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
        encounter_area = place.city.areas.sample

        move_to encounter_area

        [
          PlayerVisitedPlaceEvent.new(place: encounter_area, previous_place: previous_place),
          RandomEvent.sample(destination, previous_place)
        ]
      end

      def random_encounter?
        rand >= 0.8
      end
    end
  end
end
