module Dragon
  class MaterialStrength
  end

  class Fragile < MaterialStrength
    def modifier
      -3
    end
  end

  class VeryWeak < MaterialStrength
    def modifier
      -1
    end
  end

  class Weak < MaterialStrength
    def modifier
      0
    end
  end

  class Strong < MaterialStrength
    def modifier
      1
    end
  end

  class VeryStrong < MaterialStrength
    def modifier
      2
    end
  end

  class ExtremelyStrong < MaterialStrength
    def modifier
      3
    end
  end

  class Unbreakable < MaterialStrength
    def modifier
      5
    end
  end
end
