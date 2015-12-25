module Dragon
  module Handlers
    class RemoveAccessoryCommandHandler < CommandHandler
      def handle(command)
        player = command.player
        accessory = command.accessory

        player.take_off! accessory

        [ 
          PlayerRemovedAccessoryEvent.new(player: player, accessory: accessory),
          PlayerReflectedEvent.new(player: player)
        ]
      end
    end
  end
end
