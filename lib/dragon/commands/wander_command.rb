module Dragon
  module Commands
    class WanderCommand < Command
      attr_accessor :place, :label

      def initialize(place: nil, label: nil)
        @place = place
        @label = label || "Wander around #{place.describe}"
      end

      def describe
        "You wander around #{place.describe}"
      end
    end
  end
end
