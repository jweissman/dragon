module Dragon
  class Store < Building
    tagged :commerce

    def required_professions
      [ Trader ]
    end

    def room_types
      [ Lobby, Hall, Study, CommonRoom ]
    end
  end
end
