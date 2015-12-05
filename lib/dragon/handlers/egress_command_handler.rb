module Dragon
  module Handlers
    class EgressCommandHandler < CommandHandler
      def handle(command)
        previous_place = engine.place

        area = command.place.building.city.areas.first
        engine.move_to area

        PlayerVisitedPlaceEvent.new(place: area, previous_place: previous_place)
      end
    end
  end
end
