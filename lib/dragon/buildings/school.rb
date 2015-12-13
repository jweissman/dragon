module Dragon
  module Buildings
    class School < Building
      def required_professions
        [ Teacher ]
      end

      def associated_professions
        [ Sage, Wizard, Bard ]
      end

      def room_types
        [ Study, Hall, Courtyard ]
      end
    end
  end
end
