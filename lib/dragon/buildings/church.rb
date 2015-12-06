module Dragon
  class Church < Building
    def associated_professions
      %w[ priest penitent acolyte ]
    end
  
    def room_types
      [ Nave, Sanctuary, Refectory, Study, Hall, Courtyard ]
    end
  end
end
