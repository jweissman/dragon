module Dragon
  module Professions
    class Adventurer < Profession
      include CombatAttributes

      tagged :wandering, :quests

      def default_weapon
        @default_weapon ||= Sword.new
      end

      def base_range # for stats...
        (10..12)
      end
    end
  end
end
