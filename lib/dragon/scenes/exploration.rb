module Dragon
  module Scenes
    class Exploration < Scene
      def describe
        "exploring"
      end

      def actions(place)
        if last_event && last_event.actions.any?
          last_event.actions
        else
          people_actions(place) +
            outdoor_actions(place) +
            indoor_actions(place) +
            base_actions
        end
      end

      protected
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

        visit_building_actions(place) + 
          travel_actions(place) + 
          wander_actions(place)
      end

      def wander_actions(place)
        return [] unless place.can_wander?
        [ WanderCommand.new(place: place) ]
      end

      def travel_actions(place)
        towns = place.town.world.towns - [place.town]
        towns.collect(&method(:travel))
      end

      def visit_building_actions(place)
        buildings = place.town.buildings + (place.town.areas - [place])
        buildings.collect(&method(:visit))
      end

      private
      def converse_with(partner)
        ConverseCommand.new(partner: partner)
      end

      def visit(place)
        VisitCommand.new(place: place)
      end

      def egress_from(place)
        EgressCommand.new(place: place)
      end

      def travel(place)
        TravelCommand.new(destination: place)
      end
    end
  end
end
