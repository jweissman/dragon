module Dragon
  class ConversationTopic
  end

  class NullTopic < ConversationTopic
    def describe(partner)
      "talking with #{partner.name}"
    end

    def actions(*)
      []
    end
  end

  class Commerce < ConversationTopic
    def describe(partner)
      "trading with #{partner.name}"
    end

    def actions(partner)
      partner.profession.items_for_sale.map do |item|
        [
          Dragon::Commands::PurchaseItemCommand.new(item: item, cost: item.cost * 2, merchant: partner)
        ]
      end
    end
  end

  # class Gambling < ConversationTopic
  #   attr_reader :pot, :wager_amount

  #   def initialize
  #     @pot = 0
  #     @wager_amount = 2
  #   end
  #
  #   def describe(partner)
  #     "gambling with #{partner.name}"
  #   end
  #
  #   def actions
  #     outcomes.map do |outcome|
  #       PlaceWager.new(on: outcome, amount: wager_amount)
  #     end
  #     # [
  #     #   PlaceWager.new(on: 'heads', amount: wager_amount),
  #     #   PlaceWager.new(on: 'tails', amount: wager_amount)
  #     #   # place wager
  #     # ]
  #   end
  #   def outcomes
  #     %w[ heads tails ]
  #   end
  # end


end
