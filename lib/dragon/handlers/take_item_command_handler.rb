module Dragon
  module Handlers
    class TakeItemCommandHandler < CommandHandler
      def handle(command)
        item = command.item

        player.inventory.push item

        events = [
          ItemTakenEvent.new(item: item, cause: "you took #{item.describe}")
        ]

        if engine.last_destination
          events.push RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place)
        end
        
        events
      end
    end
  end
end
