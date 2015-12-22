module Dragon
  module Creatures
    class Frog < Amphibian
      def resilience_range
        (0..1)
      end

      def power_range
        (2..3)
      end
    end
  end
end
