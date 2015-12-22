module Dragon
  module Professions
    class Warrior < Adventurer
      tagged :fighting, :brawling

      def resilience_range
        (15..18)
      end

      def power_range
        (16..19)
      end
    end
  end
end
