module Dragon
  module Handlers
    class ExitGameCommandHandler < CommandHandler
      def handle(command)
        engine.halt!
        "Well bye!"
      end
    end
  end
end
