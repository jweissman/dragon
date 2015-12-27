module Dragon
  module Creatures
    class Reptile < Creature
      tagged :water

      def default_armor
        Scales.new
      end

      def self.mind_class
        Dimwitted
      end

      def self.size_class
        Small
      end

      def self.spirit_class
        VeryLowSpirited
      end
    end
  end
end
