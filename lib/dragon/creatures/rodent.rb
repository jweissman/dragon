module Dragon
  module Creatures
    class Rodent < Mammal
      def self.size_class
        VerySmall
      end

      def self.mind_class
        Slow
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
