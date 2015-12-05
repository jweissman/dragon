module Dragon
  module Events
    class PlayerPassedOutEvent < Event
      attr_reader :player, :place, :cause

      def initialize(player: nil, place: nil, cause: nil)
        @player = player
        @place  = place
        @cause  = cause
      end

      def describe
        "#{cause} and you lost consciousness! You awaken in a hospital in #{place.city.name}"
      end
    end
  end
end
