module Dragon
  module Professions
    class Trader < Profession
      tagged :commerce, :urban

      def conversation_topics
        [ Topics::Commerce ]
      end

      def items_for_sale
        Array.new(4) { Items::Equipment.generate }
      end
    end
  end
end
