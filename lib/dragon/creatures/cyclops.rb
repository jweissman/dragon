module Dragon
  module Creatures
    class Cyclops < Hominid
      def self.mind_class
        Slow
      end

      def self.size_class
        VeryLarge
      end

      def self.spirit_class
        ExtremelySpirited
      end
    end
  end
end
