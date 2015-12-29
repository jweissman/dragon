module Dragon
  module Items
    class WarHammer < Weapon
      def base_cost
        125
      end

      def base_damage
        (2..9)
      end
    end
  end
end
