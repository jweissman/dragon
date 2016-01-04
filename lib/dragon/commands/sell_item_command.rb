module Dragon
  module Commands
    class SellItemCommand < Command
      attr_reader :item, :cost, :recipient

      def initialize(item: nil, cost: nil, recipient: nil)
        @item = item
        @cost = cost
        @recipient = recipient
      end

      def label
        "Sell #{item.describe} for #{cost} gold"
      end

      def describe
        "You offer #{recipient.name} the #{item.describe}"
      end
    end
  end
end
