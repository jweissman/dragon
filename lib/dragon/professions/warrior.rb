module Dragon
  module Professions
    class Warrior < Adventurer
      tagged :fighting, :brawling

      def default_weapon
        @default_weapon ||= Sword.new
      end

      def resilience_range
        (12..14)
      end

      def power_range
        (15..18)
      end
    end
  end
end
