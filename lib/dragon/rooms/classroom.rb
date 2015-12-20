module Dragon
  module Rooms
    class Classroom < Room
      tagged :education, :learning, :lore, :writing, :reading

      def self.required_professions
        [ Teacher ]
      end
    end
  end
end
