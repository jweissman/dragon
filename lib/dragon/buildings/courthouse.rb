module Dragon
  module Buildings
    class Courthouse < Building
      tagged :government, :law, :crime

      def required_professions
        [ Judge ]
      end
    end
  end
end
