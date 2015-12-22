module Dragon
  module Creatures
    class Turtle < Reptile
      def resilience_range
        (10..12)
      end

      def calm_range
        (12..14)
      end
    end
  end
end
