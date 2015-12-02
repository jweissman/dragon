module Dragon
  module Handlers
    class ConverseCommandHandler < CommandHandler
      def handle(command)
        if rand > 0.1
          conversation = engine.conversation_with(command.partner)
          engine.transition_to(conversation)
          "#{command.partner.label} greets you"
        else
          "#{command.partner.label} does not seem to be feel like talking right now"
        end
      end
    end
  end
end
