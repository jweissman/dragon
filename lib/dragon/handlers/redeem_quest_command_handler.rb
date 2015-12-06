module Dragon
  module Handlers
    class RedeemQuestCommandHandler < CommandHandler
      def handle(command)
        quest = command.quest

        engine.player.inventory.push quest.reward
        engine.player.quests -= [quest]

        QuestRedeemedEvent.new(quest: quest)
      end
    end
  end
end
