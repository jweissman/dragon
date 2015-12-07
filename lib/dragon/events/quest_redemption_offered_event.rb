module Dragon
  module Events
    # class QuestRedemptionOfferedEvent < Event
    #   attr_reader :quest

    #   def initialize(quest: nil)
    #     @quest = quest
    #   end

    #   def describe
    #     "#{quest.requestor.name} offers to redeem the quest #{quest.label} for #{quest.reward.describe}"
    #   end

    #   def actions
    #     [ 
    #       Dragon::Commands::RedeemQuestCommand.new(quest: quest)
    #     ]
    #   end
    # end
  end
end
