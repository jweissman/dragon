module Dragon
  module Areas
    class Docks < Area
      tagged :urban, :sea, :shipping, :work

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
