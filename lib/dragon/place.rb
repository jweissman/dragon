module Dragon
  class Place < Entity
    def can_wander?; true end
    def common_area?; false end
  end
end
