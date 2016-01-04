module Dragon
  module Events
    class ItemSoldEvent < Event
      attr_reader :item, :cost, :recipient

      def initialize(item: nil, cost: nil, recipient: nil)
        @item = item
        @cost = cost
        @recipient = recipient
      end

      def describe
        "You sold the #{item.describe} to #{recipient.name} for #{cost} gold"
      end
    end
  end
end
