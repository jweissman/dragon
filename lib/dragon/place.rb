module Dragon
  class Place < Entity
    include Aspects 

    def self.populated?
      false
    end

    def self.can_wander?
      true
    end

    def self.common_area?
      false 
    end

    def narrator
      PlaceNarrator.new(self)
    end
  end
end
