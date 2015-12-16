module Dragon
  module Buildings
    class Prison < Building
      tagged :government, :evil, :crime, :law

      def required_professions
        [ Constable ]
      end
    end
  end
end
