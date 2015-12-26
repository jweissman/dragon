module Dragon
  module Professions
    class Soldier < Adventurer
      tagged :military, :army, :fighting, :brawling, :law

      def default_weapon
        @default_weapon ||= Axe.new
      end

      def focus_range
        (12..14)
      end

      def power_range
        (15..18)
      end
    end
  end
end
