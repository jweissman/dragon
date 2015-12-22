module Dragon
  module Handlers
    class WearArmorCommandHandler < CommandHandler
      def handle(command)
        player = command.player
        armor  = command.armor

        player.wear!(armor)

        [ 
          PlayerWoreArmorEvent.new(player: player, armor: armor),
          PlayerReflectedEvent.new(player: player)
        ]
      end
    end
  end
end
