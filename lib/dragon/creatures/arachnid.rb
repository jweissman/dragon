module Dragon
  module Creatures
    class Arachnid < Creature
      tagged :poison, :dark, :evil

      def resilience_range
        (2..3)
      end
    end
  end
end
