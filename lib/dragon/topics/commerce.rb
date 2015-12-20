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
        partner.profession.items_for_sale.map do |item|
          purchase_item(item, partner)
        end
      end
    end
  end
end
