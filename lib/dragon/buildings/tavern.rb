module Dragon
  class Tavern < Building
    def associated_professions
      %w[ barkeep drunk waiter gambler bard ]
    end

    def room_types
      [ GreatHall, Study, Kitchen ]
    end
  end
end
