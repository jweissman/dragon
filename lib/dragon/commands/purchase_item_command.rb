module Dragon
  module Commands
    class PurchaseItemCommand < Command
      attr_reader :item, :cost, :merchant

      def initialize(item: nil, cost: nil, merchant: nil)
        @item = item
        @cost = cost
        @merchant = merchant
      end

      def label
        "Buy #{item.describe} for #{cost} gold"
      end

      def describe
        "You ask #{merchant.name} if you can buy #{item.describe}"
      end
    end
  end
end
