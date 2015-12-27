module Dragon
  module Creatures
    class Gorilla < Ape
      def self.spirit_class
        ExtremelySpirited
      end

      def self.size_class
        VeryLarge
      end
    end
  end
end
