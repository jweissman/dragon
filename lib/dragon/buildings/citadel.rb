module Dragon
  module Buildings
    class Citadel < Building
      tagged :military

      def required_professions
        [ Commander ]
      end
    end
  end
end
