module Dragon
  module Creatures
    class Reptile < Creature
      tagged :water

      def default_armor
        Scales.new
      end

      def resilience_range
        (10..13)
      end
    end
  end
end
