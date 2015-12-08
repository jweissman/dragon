module Dragon
  module Handlers
    class ExitGameCommandHandler < CommandHandler
      def handle(command)
        transition_to welcome
        PlayerLeftRealmsEvent.new
      end
    end
  end
end
