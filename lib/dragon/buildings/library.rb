module Dragon
  module Buildings
    class Library < Building
      tagged :learning, :books, :meeting, :lore

      def required_professions
        [ Scribe ]
      end
    end
  end
end
