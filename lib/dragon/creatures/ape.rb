module Dragon
  module Creatures
    class Ape < Primate
      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        Medium
      end
    end
  end
end
