module Dragon
  module Creatures
    class Basilisk < Snake
      tagged :water, :stone

      def self.mind_class
        Smart
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
