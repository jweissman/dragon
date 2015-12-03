module Dragon
  module Handlers
    class EgressCommandHandler < CommandHandler
      def handle(command)
        area = command.place.building.town.areas.first
        engine.move_to area

        PlayerVisitedPlaceEvent.new(place: area)
      end
    end
  end
end
