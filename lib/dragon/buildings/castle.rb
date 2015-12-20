module Dragon
  module Buildings
    class Castle < Building
      tagged :royal, :entertainment, :military, :law, :big, :eating

      def self.unique?
        true
      end

      def self.available_in?(city)
        city.is_a?(Capital)
      end

      def self.required_in?(city)
        city.is_a?(Capital)
      end

      def required_professions
        [ King, Queen ]
      end

      def required_room_types
        [ ThroneRoom ]
      end
    end
  end
end
