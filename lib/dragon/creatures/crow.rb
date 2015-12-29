module Dragon
  module Creatures
    class Crow < Avian
      def self.spirit_class
        HighSpirited
      end

      def self.mind_class
        Dimwitted
      end

      def self.size_class
        Tiny
      end
    end
  end
end
