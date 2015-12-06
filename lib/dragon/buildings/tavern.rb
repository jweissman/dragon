module Dragon
  class Tavern < Building
    def associated_professions
      [ Barkeep, Drunk, Gambler, Bard ]
    end

    def room_types
      [ GreatHall, Study, Kitchen ]
    end
  end
end
