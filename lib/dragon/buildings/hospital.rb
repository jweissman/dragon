module Dragon
  class Hospital < Building
    def associated_professions
      %w[ nurse priest student ]
    end

    def room_types
      [ Ward, Surgery, Nursery, Hall ]
    end
  end
end
