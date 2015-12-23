module Dragon
  module Handlers
    class PurchaseItemCommandHandler < CommandHandler
      def handle(command)
        item     = command.item
        cost     = command.cost
        merchant = command.merchant

        if engine.player.gold >= cost
          engine.player.inventory.push(item)
          engine.player.gold -= cost

          ItemTakenEvent.new(item: item, cause: "you gave #{merchant.name} #{cost} gold")
        else
          WordsSpokenEvent.new(person: merchant, message: "You cannot afford the #{item.describe}! You would have to pay #{cost} gold, but you only have #{engine.player.gold}")
        end
      end
    end
  end
end
