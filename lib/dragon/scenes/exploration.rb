module Dragon
  module Scenes
    class Exploration < Scene
      def describe
        "exploring"
      end

      def actions(place)
        people_actions(place) +
          outdoor_actions(place) +
          indoor_actions(place) +
          base_actions
      end

      def people_actions(place)
        place.people.collect(&method(:converse_with))
      end

      def indoor_actions(place)
        return [] unless place.is_a?(Room)

        other_rooms = place.building.rooms - [place]
        other_rooms.collect(&method(:visit)) + [egress_from(place)]
      end

      def outdoor_actions(place)
        return [] unless place.is_a?(Area)

        buildings = place.town.buildings + (place.town.areas - [place])
        buildings.collect(&method(:visit))
      end

      protected
      def converse_with(partner)
        ConverseCommand.new(partner: partner)
      end

      def visit(place)
        VisitCommand.new(place: place)
      end

      def egress_from(place)
        EgressCommand.new(place: place)
      end
    end
  end
end
