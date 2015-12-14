module Dragon
  class Tavern < Building
    tagged :games, :alcohol, :music, :dark

    def required_professions
      [ Barkeep ]
    end

    def room_types
      [ GreatHall, Study, Kitchen ]
    end
  end
end
