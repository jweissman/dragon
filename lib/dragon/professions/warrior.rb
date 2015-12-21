module Dragon
  module Professions
    class Warrior < Adventurer
      tagged :fighting, :brawling

      def default_max_hp
        60
      end
    end
  end
end
