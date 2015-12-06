module Dragon
  class House < Building
    def associated_professions
      Profession.basic
    end

    def room_types
      [ LivingRoom, Bedroom, Study, Kitchen, SunRoom, Hall ]
    end
  end
end
