module Dragon
  module Topics
    class Commerce < ConversationTopic
      def describe
        "engaging in commerce"
      end

      def actions(*)
        partner.profession.items_for_sale.map do |item|
          [
            Dragon::Commands::PurchaseItemCommand.new(
              item: item,
              cost: item.cost * 2,
              merchant: partner
          )
          ]
        end
      end
    end
  end
end
