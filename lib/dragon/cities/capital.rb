module Dragon
  module Cities
    class Capital < City
      def self.unique?
        true
      end

      def building_count_range
        (7..8)
      end
    end
  end
end
