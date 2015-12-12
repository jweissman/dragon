module Dragon
  class Place < Entity
    def can_wander?
      true 
    end

    def common_area?
      false 
    end

    def narrator(terminal)
      PlaceNarrator.new(self, terminal: terminal)
    end
  end
end
