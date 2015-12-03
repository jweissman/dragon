module Dragon
  module Handlers
    class TravelCommandHandler < CommandHandler
      def handle(command)
        destination = command.destination
        travel destination
      end

      def travel(destination)
        engine.travel_to destination
        PlayerTravelledToTownEvent.new(place: destination) 
      end
    end
  end
end
