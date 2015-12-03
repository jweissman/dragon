module Dragon
  module Handlers
    class WanderCommandHandler < CommandHandler
      def handle(command)
        place = command.place

        events_for(place).sample
      end

      def events_for(place)
        [
          ItemFoundEvent.new(item: Item.generate)
        ]
      end
    end
  end
end
