module Dragon
  module Topics
    class Commerce < ConversationTopic
      def describe
        "trading with #{partner.name}"
      end

      def show_gold?
        true
      end

      def show_items?
        true
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
