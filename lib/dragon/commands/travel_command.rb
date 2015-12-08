module Dragon
  module Commands
    class TravelCommand < Command
      attr_reader :destination, :label

      def initialize(destination: nil, label: nil)
        @destination = destination
        @label = label || "Travel to #{destination.label}"
      end

      def describe
        "You set out for #{destination.describe}"
      end

      def label
        @label
      end
    end
  end
end
