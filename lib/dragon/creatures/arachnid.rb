module Dragon
  module Creatures
    class Arachnid < Creature
      tagged :poison, :dark, :evil

      def self.max_hp
        25
      end
    end
  end
end
