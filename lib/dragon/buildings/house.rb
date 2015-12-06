module Dragon
  class House < Building
    def associated_professions
      %w[ wife child husband grandmother ]
    end

    def room_types
      [ LivingRoom, Bedroom, Study, Kitchen, SunRoom, Hall ]
    end
  end
end
