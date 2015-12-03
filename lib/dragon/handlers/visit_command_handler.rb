module Dragon
  module Handlers
    class VisitCommandHandler < CommandHandler
      def handle(command)
        place = infer_destination_from(command.place)
        visit(place)
      end

      def visit(place)
        engine.move_to(place)
        "You visit #{place.describe}"
      end

      protected
      def infer_destination_from(place)
        if place.is_a?(Building)
          place.rooms.sample
        else
          place
        end
      end
    end
  end
end

