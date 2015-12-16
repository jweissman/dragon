module Dragon
  module Buildings
    class Church < Building
      tagged :rural, :religious, :meeting, :praying

      def self.unique?
        true
      end

      def required_professions
        [ Priest ]
      end
    end
  end
end
