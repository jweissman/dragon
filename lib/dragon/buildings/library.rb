module Dragon
  class Library < Building
    def associated_professions
      %w[ student scribe professor reader ]
    end

    def room_types
      [ Study, Archive, Hall, Courtyard ]
    end
  end
end
