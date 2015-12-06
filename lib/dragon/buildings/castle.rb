module Dragon
  class Castle < Building
    def self.unique?
      true
    end

    def self.available_in?(city)
      city.class == Capital
    end

    def self.required_in?(city)
      city.class == Capital
    end

    def associated_professions
      %w[ king queen nobleman noblewoman soldier ]
    end

    def required_room_types
      [ ThroneRoom ]
    end

    def room_types
      [ Tower, GreatHall, Courtyard, Study, Kitchen ]
    end
  end
end
