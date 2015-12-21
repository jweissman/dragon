module Dragon
  module Rooms
    class ThroneRoom < Room
      tagged :royal, :court, :drafting, :writing, :law, :good

      def self.unique?
        true
      end

      def self.available_in?(building)
        building.is_a?(Castle)
      end
    end
  end
end
