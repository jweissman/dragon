module Dragon
  module Creatures
    class Amphibian < Creature
      tagged :water 

      def default_armor
        Scales.new
      end
    end
  end
end
