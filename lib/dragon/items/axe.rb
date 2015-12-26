module Dragon
  module Items
    class Axe < Weapon
      def base_cost
        150
      end

      def base_damage
        (3..8)
      end
    end
  end
end
