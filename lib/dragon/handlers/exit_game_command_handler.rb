module Dragon
  module Handlers
    class ExitGameCommandHandler < CommandHandler
      def handle(command)
        halt!

        PlayerLeftRealmsEvent.new
      end
    end
  end
end
