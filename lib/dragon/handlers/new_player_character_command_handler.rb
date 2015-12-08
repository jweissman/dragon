module Dragon
  module Handlers
    class NewPlayerCharacterCommandHandler < CommandHandler
      def handle(command)
        NewPlayerCharacterUnderConstructionEvent.new
      end

      def console
        engine.terminal.console
      end
    end
  end
end
