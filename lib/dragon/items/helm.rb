module Dragon
  module Items
    class Helm < Accessory
      def base_cost
        50
      end

      def base_absorption
        (0..2)
      end
    end
  end
end
