module Dragon
  module Items
    class GreatSword < Weapon
      def base_cost
        350
      end

      def base_damage
        (2..8)
      end
    end
  end
end
