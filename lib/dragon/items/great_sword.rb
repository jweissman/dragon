module Dragon
  module Items
    class GreatSword < Weapon
      def base_cost
        350
      end

      def base_damage
        (1..12)
      end
    end
  end
end
