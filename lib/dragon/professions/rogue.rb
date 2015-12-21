module Dragon
  module Professions
    class Rogue < Adventurer
      tagged :crime, :dark, :evil, :stealing

      def default_max_hp
        26
      end
    end
  end
end
