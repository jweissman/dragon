module Dragon
  module Creatures
    class Primate < Mammal
      tagged :trees, :forest

      def resilience_range
        (12..15)
      end

      def intellect_range
        (7..8)
      end
    end
  end
end
