module Dragon
  class Library < Building
    tagged :learning, :books, :meeting, :lore

    def associated_professions
      [ Student, Teacher, Minister, Wizard, Scribe ]
    end
  end
end
