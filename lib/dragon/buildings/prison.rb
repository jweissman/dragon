module Dragon
  module Buildings
    class Prison < Building
      def required_professions
        [ Constable ]
      end

      def associated_professions
        [ Drunk, Gambler, Beggar ]
      end

      def room_types
        [ Kitchen, Lobby, Hall, Courtyard ]
      end
    end
  end
end
