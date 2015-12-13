module Dragon
  module Areas
    class Alley < Area
      def self.can_wander?
        false
      end

      def self.common_area?
        true
      end

      def populated?
        true
      end

      def professions
        [ Gambler ] + super
      end
    end
  end
end
