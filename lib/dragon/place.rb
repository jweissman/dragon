module Dragon
  class Place < Entity
    def heroes
      @heroes ||= []
    end

    def can_wander?; true end
  end
end
