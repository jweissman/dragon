module Dragon
  module Commands
    class TakeItemCommand < Command
      attr_reader :item
      
      def initialize(item: nil)
        @item = item
      end

      def describe
        "You pick up the #{@item.describe}"
      end

      def label
        "Take #{@item.describe}"
      end
    end
  end
end
