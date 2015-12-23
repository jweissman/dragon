module Dragon
  module Handlers
    class LevelUpCommandHandler < CommandHandler
      def handle(command)
        player = command.player

        player.profession.upgrade!

        PlayerLevelledUpEvent.new(player: player)
      end
    end
  end
end
