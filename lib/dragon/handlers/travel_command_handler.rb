module Dragon
  module Handlers
    class TravelCommandHandler < CommandHandler
      def handle(command)
        destination = command.destination
        travel destination
      end

      def travel(destination)
        previous_place = engine.place
        engine.travel_to destination

        [
          PlayerTravelledToTownEvent.new(place: destination),
          PlayerVisitedPlaceEvent.new(place: engine.place, previous_place: previous_place)
        ]
      end
    end
  end
end
