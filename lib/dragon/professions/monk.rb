module Dragon
  module Professions
    class Monk < Adventurer
      tagged :holy, :praying, :kneeling, :religious, :clergy

      def default_weapon
        @default_weapon ||= Fists.new
      end

      def resilience_range
        (12..14)
      end
    end
  end
end
