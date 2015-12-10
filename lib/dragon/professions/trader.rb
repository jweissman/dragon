module Dragon
  module Professions
    class Trader < Profession
      def conversation_topics
        [ Topics::Commerce ]
      end

      def items_for_sale
        Array.new(4) { Item.generate }
      end
    end
  end
end
