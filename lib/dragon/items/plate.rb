module Dragon
  module Items
    class Plate < Armor
      def self.materials
        [ Iron, Bronze, Steel ]
      end

      def base_cost
        250
      end

      def base_absorption
        (7..8)
      end
    end
  end
end
