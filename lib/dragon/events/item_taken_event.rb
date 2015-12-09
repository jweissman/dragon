module Dragon
  module Events
    class ItemTakenEvent < Event
      attr_reader :item, :cause

      def initialize(item: nil, cause: nil)
        @item = item
        @cause = cause
      end
      
      def describe
        "#{cause}, and added #{item.describe} to your inventory"
      end
    end
  end
end
