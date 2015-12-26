module Dragon
  module Items
    class Dagger < Weapon
      def base_cost
        75
      end

      def base_damage
        (2..7)
      end
    end
  end
end
