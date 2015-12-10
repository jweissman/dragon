module Dragon
  module Handlers
    class EgressCommandHandler < CommandHandler
      def handle(command)
        previous_place = place

        area = command.place.building.city.areas.select(&:common_area?).sample
        move_to area

        PlayerVisitedPlaceEvent.new(place: area, previous_place: previous_place)
      end
    end
  end
end
