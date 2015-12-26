module Dragon
  class Quality < Entity
    def describe
      self.class.name.split('::').last.downcase
    end

    def cost_multiplier
      1.0
    end

    def modifier
      0
    end
  end

  class Terrible < Quality
    def cost_multiplier
      0.2
    end

    def modifier
      -3
    end
  end

  class Poor < Quality
    def cost_multiplier
      0.5
    end

    def modifier
      -2
    end
  end

  class Mediocre < Quality
    def cost_multiplier
      0.8
    end

    def modifier
      -1
    end
  end

  class Normal < Quality; end

  class Good     < Quality
    def cost_multiplier
      1.3
    end

    def modifier
      1
    end
  end

  class Fine < Quality
    def cost_multiplier
      1.6
    end

    def modifier
      2
    end
  end

  class Exceptional < Quality
    def cost_multiplier
      2.2
    end

    def modifier
      3
    end
  end

  class Superb < Quality
    def cost_multiplier
      2.8
    end

    def modifier
      4
    end
  end
end
