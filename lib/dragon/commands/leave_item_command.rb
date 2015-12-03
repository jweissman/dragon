module Dragon
  module Commands
    class LeaveItemCommand < Command
      attr_reader :item
      def initialize(item: nil)
        @item = item
      end

      def describe
        "You leave the #{@item.describe} behind"
      end

      def label
        "Leave #{@item.describe}"
      end
    end
  end
end
