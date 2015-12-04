module Dragon
  module Events
    class ItemFoundEvent < Event
      attr_reader :item

      def initialize(item: nil)
        @item = item
      end

      def describe
        "You find a(n) #{item.describe}"
      end

      def actions
        [
          Dragon::Commands::TakeItemCommand.new(item: item),
          Dragon::Commands::LeaveItemCommand.new(item: item)
        ]
      end
    end
  end
end
