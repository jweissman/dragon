module Dragon
  module Handlers
    class AcceptQuestCommandHandler < CommandHandler
      def handle(command)
        quest = command.quest
        # requestor = quest.requestor

        player.quests.push quest

        QuestAcceptedEvent.new(quest: quest)
        # WordsSpokenEvent.new(
        #   person: requestor, 
        #   message: "Thank you for accepting the quest #{quest.label}"
        # )
      end
    end
  end
end
