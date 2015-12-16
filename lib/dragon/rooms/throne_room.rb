module Dragon
  module Rooms
    class ThroneRoom < Room
      tagged :royal, :court, :drafting, :writing, :law, :good

      def self.unique
        true
      end

      def self.required_professions
        [ King, Queen ]
      end
    end
  end
end
