module Dragon
  module Buildings
    class School < Building
      tagged :writing, :reading, :education, :learning, :magic, :lore, :music

      def required_professions
        [ Teacher ]
      end
    end
  end
end
