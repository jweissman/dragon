module Dragon
  module Professions
    class Rogue < Adventurer
      tagged :commerce, :crime, :dark, :evil

      def default_max_hp
        26
      end
    end
  end
end
