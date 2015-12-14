module Dragon
  module Creatures
    class Reptile < Creature
      tagged :water

      def self.max_hp
        14
      end
    end
  end
end
