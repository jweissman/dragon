module Dragon
  module Items
    class GreatSword < Weapon
      def base_cost
        350
      end

      def base_damage
        (4..12)
      end
    end
  end
end
