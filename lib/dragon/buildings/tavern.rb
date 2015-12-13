module Dragon
  class Tavern < Building
    def required_professions
      [ Barkeep ]
    end

    def associated_professions
      [ Drunk, Gambler, Bard ]
    end

    def room_types
      [ GreatHall, Study, Kitchen ]
    end
  end
end
