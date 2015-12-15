module Dragon
  class Store < Building
    tagged :commerce, :meeting

    def required_professions
      [ Trader ]
    end
  end
end
