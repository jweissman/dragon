module Dragon
  module Creatures
    class Rodent < Mammal
      def self.size_class
        Tiny
      end

      def self.mind_class
        Dimwitted
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
