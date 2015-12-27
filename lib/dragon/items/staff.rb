module Dragon
  module Items
    class Staff < Weapon
      def self.materials
        [ Wood, Iron, Bronze, Steel ]
      end

      def base_damage
        (1..6)
      end

      def base_cost
        150
      end
    end
  end
end
