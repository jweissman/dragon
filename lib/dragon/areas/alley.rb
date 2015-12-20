module Dragon
  module Areas
    class Alley < Area
      tagged :urban, :alcohol, :dice

      def self.can_wander?
        true
      end

      def self.common_area?
        true
      end

      def populated?
        true
      end

      # def professions
      #   [ Gambler, Drunk ] + super
      # end
    end
  end
end
