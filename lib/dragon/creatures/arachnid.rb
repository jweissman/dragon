module Dragon
  module Creatures
    class Arachnid < Creature
      tagged :poison, :dark, :evil

      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        Tiny
      end
      
      def self.mind_class
        Slow
      end
    end
  end
end
