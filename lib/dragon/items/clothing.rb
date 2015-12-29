module Dragon
  module Items
    class Clothing < Armor
      def self.materials
        [ Cloth ]
      end

      def base_cost
        10
      end

      def base_absorption
        (0..1)
      end
    end
  end
end
