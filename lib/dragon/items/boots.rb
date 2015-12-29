module Dragon
  module Items
    class Boots < Accessory
      def base_cost
        25
      end

      def base_absorption
        (0..1)
      end
    end
  end
end
