module Dragon
  module Rooms
    class ThroneRoom < Room
      tagged :royal, :court, :law, :drafting, :writing

      def self.unique
        true
      end

      def self.required_professions
        [ King, Queen ]
      end
    end
  end
end
