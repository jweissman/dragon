module Dragon
  module Creatures
    class Ooze < Creature
      tagged :evil

      def self.max_hp
        15
      end
    end
  end
end
