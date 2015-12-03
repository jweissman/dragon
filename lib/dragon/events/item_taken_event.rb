module Dragon
  module Events
    class ItemTakenEvent < Event
      attr_reader :item

      def initialize(item: item)
        @item = item
      end
      
      def describe
        "The #{@item.describe} was added to your inventory"
      end
    end
  end
end
