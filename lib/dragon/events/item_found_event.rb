module Dragon
  module Events
    class ItemFoundEvent < Event
      attr_reader :item, :destination

      def initialize(item: nil, destination: nil)
        @item = item
        @destination = nil
      end

      def describe
        if destination
          "You find a(n) #{item.describe} on your way to #{destination.name}"
        else
          "You find a(n) #{item.describe}"
        end
      end

      def actions
        [ take_item(item), leave_item(item) ]
      end
    end
  end
end
