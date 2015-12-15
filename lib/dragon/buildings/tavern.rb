module Dragon
  class Tavern < Building
    tagged :games, :alcohol, :music, :dark, :meeting, :food

    def required_professions
      [ Barkeep ]
    end
  end
end
