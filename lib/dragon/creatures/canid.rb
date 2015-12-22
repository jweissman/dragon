module Dragon
  module Creatures
    class Canid < Mammal
      def resilience_range
        (8..10)
      end

      def focus_range
        (10..12)
      end

      def power_range
        (10..12)
      end
    end
  end
end
