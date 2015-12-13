module Dragon
  module Events
    class RandomEncounterResolvedEvent < Event
      attr_reader :destination, :current_place

      def initialize(destination: nil, current_place: nil)
        @destination = destination
        @current_place = current_place
      end

      def describe?
        false
      end

      def actions
        command_list = [
          travel(destination, "Continue journey to #{destination.name}")
        ]

        if current_place.class.can_wander?
          command_list.push(wander_around(current_place))
        elsif current_place.class.common_area?
          command_list.push(stay_here(current_place))
        end

        # don't display "return to xxx" if it's also where we were going...
        # or if we're already in the town square
        if current_place.city != destination && !current_place.class.common_area?
          command_list.push(travel(current_place.city, "Return back to #{current_place.city.name}"))
        end

        command_list
      end
    end
  end
end
