module Dragon
  module Items
    class Talons < NaturalWeapon
      def base_damage
        (2..10)
      end
    end
  end
end
