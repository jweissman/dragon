module Dragon
  module Cities
    class Village < City
      def building_count_range
        (3..4)
      end
    end
  end
end
