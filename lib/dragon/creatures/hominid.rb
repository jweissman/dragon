module Dragon
  module Creatures
    class Hominid < Ape
      def default_weapon
        @default_weapon ||= Weapon.generate(exclude_types: [ NaturalWeapon, GreatSword ], 
                                            material: self.class.default_weapon_material)
      end

      def default_armor
        @default_armor ||= Clothing.new(quality: Normal.new)
      end

      def self.default_weapon_material
        Stone.new
      end

      def self.size_class
        Medium
      end

      def self.mind_class
        Smart
      end

      def self.spirit_class
        GoodSpirited
      end
    end
  end
end
