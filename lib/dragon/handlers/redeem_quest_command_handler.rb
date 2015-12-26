module Dragon
  module Handlers
    class RedeemQuestCommandHandler < CommandHandler
      def handle(command)
        quest = command.quest

        player.inventory.push quest.item_rewards
        player.xp += quest.xp_reward
        player.bounty += 

        player.quests -= [quest]

        events = [ QuestRedeemedEvent.new(quest: quest) ]
        if player.xp > player.xp_for_upgrade
          events.push(LevelUpRequirementsMetEvent.new(player: player))
        end

        events
      end
    end
  end
end
