module Dragon
  module Creatures
    class Human < Ape
      def default_weapon
        @default_weapon ||= Weapon.generate(exclude_types: [ NaturalWeapon ])
      end

      def default_armor
        @default_armor ||= Clothing.new
      end

      def intellect_range
        (8..12)
      end
    end
  end
end
