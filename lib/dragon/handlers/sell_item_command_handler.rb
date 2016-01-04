module Dragon
  module Handlers
    class SellItemCommandHandler < CommandHandler
      def handle(command)
        item = command.item
        cost = command.cost
        recipient = command.recipient

        engine.player.inventory.delete(item)
        engine.player.gold += cost

        ItemSoldEvent.new(item: item, recipient: recipient, cost: cost)
      end
    end
  end
end
