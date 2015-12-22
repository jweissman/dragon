module Dragon
  module Buildings
    class Hospital < Building
      tagged :medicine, :healing, :learning, :injury


      def self.required_in?(city)
        city.is_a?(Capital) || city.is_a?(Metropolis)
      end

      def required_professions
        [ Nurse ]
      end
    end
  end
end
