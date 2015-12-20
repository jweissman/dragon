module Dragon
  module Cities
    class Outpost < City
      def building_count_range
        (2..3)
      end
    end
  end
end
