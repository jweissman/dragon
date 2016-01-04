module Dragon
  module Events
    class ItemLeftBehindEvent < Event
      attr_reader :item

      def initialize(item: nil)
        @item = item
      end
      
      def describe
        "The #{item.describe} was left behind"
      end
    end
  end
end
