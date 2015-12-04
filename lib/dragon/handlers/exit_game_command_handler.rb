module Dragon
  module Handlers
    class ExitGameCommandHandler < CommandHandler
      def handle(command)
        engine.halt!
        PlayerLeftRealmsEvent.new
      end
    end
  end
end
