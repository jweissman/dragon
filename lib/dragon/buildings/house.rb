module Dragon
  class House < Building
    tagged :family, :home, :domestic, :meeting, :sleep

    def associated_professions
      Profession.basic
    end
  end
end
