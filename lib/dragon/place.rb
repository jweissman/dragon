module Dragon
  class Place < Entity
    def heroes
      @heroes ||= []
    end
  end
end
