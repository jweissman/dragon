module Dragon
  module Items
    class Sword < Weapon
      def base_cost
        200
      end

      def base_damage
        (2..10)
      end
    end
  end
end
