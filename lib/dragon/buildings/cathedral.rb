module Dragon
  module Buildings
    class Cathedral < Building
      tagged :urban, :religious, :praying, :kneeling

      def self.unique?
        true
      end
    end
  end
end
