module Dragon
  module Rooms
    class CourtRoom < Room
      tagged :government, :law, :crime

      def self.unique
        true
      end

      def self.required_professions
        [ Judge, Constable ]
      end

      def self.available_in?(building)
        building.is_a?(Courthouse)
      end
    end
  end
end
