module Dragon
  module Creatures
    class Feline < Mammal
      def power_range
        (15..19)
      end

      def resilience_range
        (18..20)
      end

      def intellect_range
        (7..8)
      end
    end
  end
end
