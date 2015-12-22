module Dragon
  module Creatures
    class Avian < Creature
      tagged :sky

      def default_weapon
        Talons.new
      end
    end
  end
end
