module Dragon
  module Cities
    class Village < City
      def building_count_range
        (3..5)
      end
    end
  end
end
