module Dragon
  module Cities
    class Capital < City
      tagged :royal, :urban, :government

      def self.unique?
        true
      end

      def building_count_range
        (5..6)
      end
    end
  end
end
