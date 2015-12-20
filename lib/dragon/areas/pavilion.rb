module Dragon
  module Areas
    class Pavilion < Area
      tagged :urban, :walking

      def self.can_wander?
        true
      end

      def self.common_area?
        true
      end

      def self.populated?
        true
      end
    end
  end
end
