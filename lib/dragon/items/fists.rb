module Dragon
  module Items
    class Fists < NaturalWeapon
      def self.materials
        [ Flesh ]
      end

      def base_damage
        (0..2)
      end
    end
  end
end
