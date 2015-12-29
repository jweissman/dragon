module Dragon
  module Items
    class Staff < Weapon
      def self.materials
        [ Wood, Iron, Steel ]
      end

      def base_damage
        (1..3)
      end

      def base_cost
        150
      end
    end
  end
end
