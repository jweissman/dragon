module Dragon
  class Place < Entity
    def self.can_wander?
      true 
    end

    def self.common_area?
      false 
    end

    def narrator(terminal)
      PlaceNarrator.new(self, terminal: terminal)
    end
  end
end
