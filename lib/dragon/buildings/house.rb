module Dragon
  module Buildings
    class House < Building
      tagged :family, :home, :domestic

      def associated_professions
        Profession.basic
      end

      def self.unique
        false
      end
    end
  end
end
