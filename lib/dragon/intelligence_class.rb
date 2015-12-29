module Dragon
  class IntelligenceClass
    def mind_range
      (10..10)
    end

    def intellect_range
      mind_range
    end

    def focus_range
      mind_range
    end
  end

  class Dimwitted < IntelligenceClass
    def mind_range
      (7..8)
    end
  end

  class Slow < IntelligenceClass
    def mind_range
      (9..9)
    end
  end

  class Simple < IntelligenceClass
  end

  class Smart < IntelligenceClass
    def mind_range
      (11..12)
    end
  end

  class VerySmart < IntelligenceClass
    def mind_range
      (12..13)
    end
  end

  class Brilliant < IntelligenceClass
    def mind_range
      (14..16)
    end
  end

  class Genius < IntelligenceClass
    def mind_range
      (19..20)
    end
  end
end
