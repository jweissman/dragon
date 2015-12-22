module Dragon
  module Creatures
    class Reptile < Creature
      tagged :water

      def resilience_range
        (10..13)
      end
    end
  end
end
