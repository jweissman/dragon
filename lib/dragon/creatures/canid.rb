module Dragon
  module Creatures
    class Canid < Mammal
      def self.mind_class
        Simple
      end

      def self.size_class
        Medium
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
