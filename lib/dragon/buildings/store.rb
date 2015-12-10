module Dragon
  class Store < Building
    def required_professions
      [ Trader ]
    end

    def associated_professions
      [ Trader, Rogue, Gambler, Constable ]
    end

    def room_types
      [ Lobby, Hall, Study, CommonRoom ]
    end
  end
end
