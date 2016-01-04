module Dragon
  module Topics
    class Commerce < ConversationTopic
      def label
        "trading"
      end

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
        purchase_actions + sale_actions
      end

      def sale_actions
        salable_wares.map do |item|
          sell_item(item, partner)
        end
      end

      def purchase_actions
        partner.profession.items_for_sale.map do |item|
          purchase_item(item, partner)
        end
      end

      def salable_wares
        player.inventory.reject do |item|
          item == player.armor ||
            item == player.weapon ||
            player.accessories.values.flatten.include?(item)
        end
      end
    end
  end
end
