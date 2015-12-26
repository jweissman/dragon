module Dragon
  module Creatures
    class Avian < Creature
      tagged :sky

      def default_weapon
        Talons.new
      end

      def self.size_class
        VerySmall
      end
    end
  end
end
