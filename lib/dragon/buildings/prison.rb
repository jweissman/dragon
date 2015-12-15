module Dragon
  module Buildings
    class Prison < Building
      tagged :evil, :games, :law, :crime, :meeting

      def required_professions
        [ Constable ]
      end
    end
  end
end
