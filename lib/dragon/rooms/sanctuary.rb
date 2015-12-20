module Dragon
  module Rooms
    class Sanctuary < Room
      tagged :holy, :praying

      def self.available_in?(building)
        building.is_a?(Cathedral) || building.is_a?(Church)
      end
    end
  end
end
