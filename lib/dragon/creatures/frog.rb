module Dragon
  module Creatures
    class Frog < Amphibian
      def self.mind_class
        Dimwitted
      end

      def self.size_class
        Tiny
      end

      def self.spirit_class
        GoodSpirited
      end
    end
  end
end
