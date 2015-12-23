module Dragon
  module Professions
    class Trader < Profession
      include Items

      tagged :commerce, :urban

      def conversation_topics
        [ Topics::Commerce ]
      end

      def items_for_sale
        weapons + armor + accessories
      end

      def weapons
        Array.new(2) { Equipment.generate(exclude_types: [NaturalWeapon], only_types: [Weapon]) }
      end

      def armor
        Array.new(2) { Equipment.generate(exclude_types: [NaturalArmor], only_types: [Armor]) }
      end

      def accessories
        Array.new(3) { Equipment.generate(only_types: [Accessory]) }
      end
    end
  end
end
