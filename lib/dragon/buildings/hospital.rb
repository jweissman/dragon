module Dragon
  class Hospital < Building
    def associated_professions
      [ Priest, Student ]
    end

    def room_types
      [ Ward, Surgery, Nursery, Hall ]
    end
  end
end
