module Dragon
  module Handlers
    class StayHereCommandHandler < CommandHandler
      def handle(command)
        place = command.place

        PlayerVisitedPlaceEvent.new(place: place)
      end
    end
  end
end
