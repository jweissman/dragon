module Dragon
  module Buildings
    class Prison < Building
      tagged :evil, :games, :law, :crime

      def required_professions
        [ Constable ]
      end

      def room_types
        [ Kitchen, Lobby, Hall, Courtyard ]
      end
    end
  end
end
