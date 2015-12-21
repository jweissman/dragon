module Dragon
  module Professions
    class Soldier < Adventurer
      tagged :military, :army, :fighting, :brawling, :law

      def default_max_hp
        35
      end
    end
  end
end
