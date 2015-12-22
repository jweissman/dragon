module Dragon
  module Professions
    class Trader < Profession
      include Items

      tagged :commerce, :urban

      def conversation_topics
        [ Topics::Commerce ]
      end

      def items_for_sale
        Array.new(4) { Equipment.generate(exclude_types: [NaturalWeapon, NaturalArmor]) }
      end
    end
  end
end
