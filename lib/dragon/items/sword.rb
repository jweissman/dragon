module Dragon
  module Items
    class Sword < Weapon
      def base_cost
        200
      end

      def base_damage
        (1..6)
      end
    end
  end
end
