module Dragon
  module Areas
    class Alley < Area
      tagged :urban

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
