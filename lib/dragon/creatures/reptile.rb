module Dragon
  module Creatures
    class Reptile < Creature
      tagged :water

      def default_armor
        Scales.new
      end

      def self.size_class
        VerySmall
      end
    end
  end
end
