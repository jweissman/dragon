module Dragon
  module Handlers
    class ContinueAdventureCommandHandler < CommandHandler
      def handle(command)
        AdventureContinuedEvent.new
      end
    end
  end
end
