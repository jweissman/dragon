module Dragon
  module Handlers
    class TakeItemCommandHandler < CommandHandler
      def handle(command)
        item = command.item

        player.inventory.push item

        # TODO add to inventory?
        # TODO view inventory?

        ItemTakenEvent.new(item: item)
      end
    end
  end
end
