module Dragon
  module Professions
    class Adventurer < Profession
      include CombatAttributes

      tagged :wandering, :quests

      def default_weapon
        @default_weapon ||= Sword.new
      end

      def base_range # for stats...
        (8..14)
      end
    end
  end
end
