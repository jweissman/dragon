module Dragon
  module Buildings
    class Market < Building
      tagged :commerce

      def required_professions
        [ Trader ]
      end
    end
  end
end
