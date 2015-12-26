module Dragon
  module Items
    class Gloves < Accessory
      def base_cost
        35
      end

      def base_absorption
        (0..2)
      end
    end
  end
end
