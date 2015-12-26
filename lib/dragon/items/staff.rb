module Dragon
  module Items
    class Staff < Weapon
      def self.materials
        [ Wood, Iron, Bronze, Steel ]
      end

      def base_damage
        (3..8)
      end

      def base_cost
        150
      end
    end
  end
end
