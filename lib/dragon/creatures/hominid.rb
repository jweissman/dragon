module Dragon
  module Creatures
    class Hominid < Ape
      def default_weapon
        @default_weapon ||= Weapon.generate(exclude_types: [ NaturalWeapon ])
      end

      def default_armor
        @default_armor ||= Clothing.new
      end
    end
  end
end
