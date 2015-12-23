module Dragon
  class Quality < Entity # TODO weird we really just need the inheritance stuff -- maybe factor it out?
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

  class Inferior < Quality
    def cost_multiplier
      0.5
    end

    def modifier
      -2
    end
  end

  class Poor < Quality
    def cost_multiplier
      0.8
    end

    def modifier
      -1
    end
  end

  class Mediocre < Quality; end

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

  class Superior < Quality
    def cost_multiplier
      2.2
    end

    def modifier
      3
    end
  end
end
