module Dragon
  module Buildings
    class Church < Building
      tagged :rural, :religious, :praying, :kneeling

      def required_professions
        [ Priest ]
      end
    end
  end
end
