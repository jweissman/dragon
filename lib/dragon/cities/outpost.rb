module Dragon
  module Cities
    class Outpost < City
      def building_count_range
        (1..2)
      end
    end
  end
end
