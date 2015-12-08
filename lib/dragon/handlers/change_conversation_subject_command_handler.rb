module Dragon
  module Handlers
    class ChangeConversationSubjectCommandHandler < CommandHandler
      def handle(command)
        partner      = command.partner
        new_subject  = command.new_subject
        conversation = command.conversation

        conversation.change_topic!(new_subject)

        ConversationSubjectChangedEvent.new(partner: partner, subject: new_subject)
      end
    end
  end
end
