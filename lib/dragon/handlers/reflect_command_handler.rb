module Dragon
  module Handlers
    class ReflectCommandHandler < CommandHandler
      def handle(command)
        player = command.player

        PlayerReflectedEvent.new(player: player)
      end
    end
  end

end
