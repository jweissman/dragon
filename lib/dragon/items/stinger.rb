module Dragon
  module Items
    class Stinger < NaturalWeapon
      def base_damage
        (0..6)
      end

      def describe(*)
        "a stinger"
      end
    end
  end
end
