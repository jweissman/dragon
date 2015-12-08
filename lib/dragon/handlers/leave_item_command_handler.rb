module Dragon
  module Handlers
    class LeaveItemCommandHandler < CommandHandler
      def handle(command)
        item = command.item

        events = [ ItemLeftBehindEvent.new(item: item) ]
        if engine.last_destination
          events.push RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place)
        end
        
        events
      end
    end
  end
end
