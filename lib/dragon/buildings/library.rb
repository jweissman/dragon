module Dragon
  class Library < Building
    tagged :learning, :books

    def associated_professions
      [ Student, Teacher, Minister, Wizard, Scribe ]
    end

    def room_types
      [ Study, Archive, Hall, Courtyard ]
    end
  end
end
