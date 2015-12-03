module Dragon
  module Commands
    class TravelCommand < Command
      attr_reader :destination

      def initialize(destination: nil)
        @destination = destination
      end

      def describe
        "You travel to #{destination.describe}"
      end

      def label
        "Travel to #{destination.name}"
      end
    end
  end
end
