module Dragon
  module Professions
    class Rogue < Adventurer
      tagged :crime, :dark, :evil, :stealing

      def default_weapon
        @default_weapon ||= Dagger.new
      end

      def resilience_range
        (11..13)
      end
    end
  end
end
