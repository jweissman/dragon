module Dragon
  module Professions
    class Rogue < Adventurer
      tagged :crime, :dark, :evil, :stealing

      def default_weapon
        @default_weapon ||= Dagger.new
      end

      def power_range
        (12..14)
      end

      def coordination_range
        (15..18)
      end
    end
  end
end
