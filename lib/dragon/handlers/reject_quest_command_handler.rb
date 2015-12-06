module Dragon
  module Handlers
    class RejectQuestCommandHandler < CommandHandler
      def handle(command)
        QuestRejectedEvent.new(quest: command.quest)
      end
    end
  end
end
