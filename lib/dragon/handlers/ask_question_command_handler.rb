module Dragon
  module Handlers
    class AskQuestionCommandHandler < CommandHandler
      def handle(command)
        partner = command.partner
        topic   = command.topic

        response = topic.responses.sample 
                   
        if topic.about_activity?
          partner.activity = topic.activity
        end

        WordsSpokenEvent.new(person: partner, message: response)
      end
    end
  end
end
