module Dragon
  module Creatures
    class Arachnid < Creature
      tagged :poison, :dark, :evil

      def self.size_class
        Tiny
      end
    end
  end
end
