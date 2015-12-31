module Dragon
  module Creatures
    class Frog < Amphibian
      def self.mind_class
        Slow
      end

      def self.size_class
        VerySmall
      end

      def self.spirit_class
        GoodSpirited
      end
    end
  end
end
