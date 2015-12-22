module Dragon
  module Professions
    class Soldier < Adventurer
      tagged :military, :army, :fighting, :brawling, :law

      def default_weapon
        @default_weapon ||= Axe.new
      end

      def resilience_range
        (13..15)
      end
    end
  end
end
