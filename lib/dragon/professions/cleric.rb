module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy, :healing, :praying, :religious

      def default_weapon
        @default_weapon ||= WarHammer.new
      end

      def focus_range
        (12..14)
      end

      def intellect_range
        (15..18)
      end
    end
  end
end
