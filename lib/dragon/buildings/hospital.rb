module Dragon
  module Buildings
    class Hospital < Building
      tagged :medicine, :healing, :learning, :meeting

      def self.unique?
        true
      end

      def required_professions
        [ Nurse ]
      end
    end
  end
end
