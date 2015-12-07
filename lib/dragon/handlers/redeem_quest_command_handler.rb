module Dragon
  module Handlers
    class RedeemQuestCommandHandler < CommandHandler
      def handle(command)
        quest = command.quest

        player.inventory.push quest.reward
        player.quests -= [quest]

        QuestRedeemedEvent.new(quest: quest)
      end
    end
  end
end
