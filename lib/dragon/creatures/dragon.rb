module Dragon
  module Creatures
    class Dragon < Reptile
      def resilience_range
        (40..60)
      end

      def intellect_range
        (20..30)
      end

      def focus_range
        (20..30)
      end

      def base_range
        (16..22)
      end
    end
  end
end
