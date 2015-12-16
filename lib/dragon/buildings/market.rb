module Dragon
  module Buildings
    class Market < Building
      tagged :commerce

      def self.unique?
        true
      end

      def required_professions
        [ Trader ]
      end
    end
  end
end
