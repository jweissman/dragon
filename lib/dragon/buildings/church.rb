module Dragon
  class Church < Building
    def required_professions
      [ Priest ]
    end

    def associated_professions
      [ Acolyte, Cleric, Teacher, Bishop ]
    end
  
    def room_types
      [ Nave, Sanctuary, Refectory, Study, Hall, Courtyard ]
    end
  end
end
