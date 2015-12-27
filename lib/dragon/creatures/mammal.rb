module Dragon
  module Creatures
    class Mammal < Creature
      tagged :aboreal

      def self.mind_class
        Slow
      end

      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        Small
      end
    end
  end
end
