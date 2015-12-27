module Dragon
  module Items
    class Axe < Weapon
      def base_cost
        150
      end

      def base_damage
        (2..6)
      end
    end
  end
end
