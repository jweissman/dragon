module Dragon
  module Items
    class Cloak < Accessory
      def base_cost
        125
      end

      def base_absorption
        (0..1)
      end
    end
  end
end
