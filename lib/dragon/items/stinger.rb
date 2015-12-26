module Dragon
  module Items
    class Stinger < NaturalWeapon
      def base_damage
        (1..12)
      end

      def describe(*)
        "a stinger"
      end
    end
  end
end
