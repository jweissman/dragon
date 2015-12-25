module Dragon
  module Handlers
    class EquipAccessoryCommandHandler < CommandHandler
      def handle(command)
        player = command.player
        accessory = command.accessory

        player.equip!(accessory)

        [
          PlayerEquippedAccessoryEvent.new(player: player, accessory: accessory),
          PlayerReflectedEvent.new(player: player)
        ]
      end
    end
  end
end
