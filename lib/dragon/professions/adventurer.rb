module Dragon
  module Professions
    class Adventurer < Profession
      include CombatAttributes

      tagged :wandering, :quests

      def base_range # for stats...
        (8..14)
      end
    end
  end
end
