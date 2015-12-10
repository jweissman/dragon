module Dragon
  module Scenes
    class Exploration < Scene
      def initialize(*args)
        @first_time = true
        super(*args)
      end

      def deep_narration?
        if @first_time
          @first_time = false
          true
        else
          false
        end
      end

      def describe
        "exploring"
      end

      def actions(place)
        if event_actions.any?
          event_actions
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

        wander_actions(place) +
          visit_building_actions(place) +
          travel_actions(place)
      end

      def wander_actions(place)
        return [] unless place.can_wander?
        [ WanderCommand.new(place: place) ]
      end

      def travel_actions(place)
        cities = place.city.world.cities - [place.city]
        cities.collect(&method(:travel))
      end

      def visit_building_actions(place)
        buildings = place.city.buildings + (place.city.areas - [place])
        buildings.collect(&method(:visit))
      end

      private
      def converse_with(person)
        ConverseCommand.new(person: person)
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
