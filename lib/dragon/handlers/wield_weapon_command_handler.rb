module Dragon
  module Handlers
    class WieldWeaponCommandHandler < CommandHandler
      def handle(command)
        player = command.player
        weapon = command.weapon

        player.wield!(weapon)

        [
          PlayerWieldedWeaponEvent.new(player: player, weapon: weapon),
          PlayerReflectedEvent.new(player: player)
        ]
      end
    end
  end
end
