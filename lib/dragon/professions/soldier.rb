module Dragon
  module Professions
    class Soldier < Adventurer
      tagged :army

      def default_max_hp
        35
      end
    end
  end
end
