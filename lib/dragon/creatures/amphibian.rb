module Dragon
  module Creatures
    class Amphibian < Creature
      tagged :water 

      def self.size_class
        Small
      end

      def self.mind_class
        Slow
      end

      def self.spirit_class
        LowSpirited
      end

      def default_armor
        Scales.new
      end
    end
  end
end
