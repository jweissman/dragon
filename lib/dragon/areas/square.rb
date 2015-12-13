module Dragon
  module Areas
    class Square < Area
      def self.can_wander?
        false
      end

      def self.common_area?
        true
      end

      def self.populated?
        true
      end

      def name
        city.name
      end

      def professions
        [ Trader ] + super
      end
    end
  end
end
