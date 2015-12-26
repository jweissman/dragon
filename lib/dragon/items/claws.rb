module Dragon
  module Items
    class Claws < NaturalWeapon
      def base_damage
        (1..8)
      end
    end
  end
end
