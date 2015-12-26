module Dragon
  module Creatures
    class Mammal < Creature
      tagged :aboreal

      def self.size_class
        Small
      end
    end
  end
end
