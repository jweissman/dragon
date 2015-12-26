module Dragon
  module Items
    class Fists < NaturalWeapon
      def self.materials
        [ Flesh ]
      end

      def base_damage
        (2..5)
      end
    end
  end
end
