module Dragon
  module Buildings
    class Hospital < Building
      tagged :medicine, :healing, :learning, :injury

      def required_professions
        [ Nurse ]
      end
    end
  end
end
