module Dragon
  module Creatures
    class Crocodile < Reptile
      def self.size_class
        Large
      end

      def self.spirit_class
        VeryHighSpirited
      end

      def self.mind_class
        Simple
      end
    end
  end
end
