module Dragon
  module Items
    class Helm < Accessory
      def base_cost
        90
      end

      def base_absorption
        (1..2)
      end
    end
  end
end
