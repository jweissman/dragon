module Dragon
  module Buildings
    class School < Building
      tagged :learning, :magic, :lore, :music

      def required_professions
        [ Teacher ]
      end

      def room_types
        [ Study, Hall, Courtyard ]
      end
    end
  end
end
