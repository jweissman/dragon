module Dragon
  class Church < Building
    tagged :holy, :lore, :learning

    def required_professions
      [ Priest ]
    end
  
    def room_types
      [ Nave, Sanctuary, Refectory, Study, Hall, Courtyard ]
    end
  end
end
