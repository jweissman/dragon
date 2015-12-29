module Dragon
  class Material
    def cost_multiplier
      1.0
    end

    def describe
      self.class.name.split('::').last.downcase
    end

    def self.basic
      [ Wood, Iron, Stone ]
    end

    def self.metallic
      [ Iron, Steel, Gold, Silver, Copper ]
    end

    def self.gemstone
      [ Ruby, Pearl, Sapphire, Onyx, Emerald, Diamond ]
    end
  end

  class Wood < Material
    def cost_multiplier
      0.4
    end

    def strength
      0
    end
  end

  class Cloth < Material
    def strength
      0
    end
  end

  class Flesh < Material
    def cost_multiplier
      0.15
    end

    def strength
      -1
    end
  end

  class Bone < Material
    def cost_multiplier
      0.4
    end

    def strength
      0
    end
  end


  class Stone < Material
    def cost_multiplier
      0.6
    end

    def strength
      0
    end
  end

  class Leather < Material
    def cost_multiplier
      0.65
    end

    def strength
      1
    end
  end

  class Iron < Material
    def cost_multiplier
      1.0
    end

    def strength
      1
    end
  end

  class Steel < Material
    def cost_multiplier
      1.8
    end

    def strength
      2
    end
  end

  class Copper < Material
    def cost_multiplier
      1.5
    end
  end

  class Silver < Material
    def cost_multiplier
      2.0
    end
  end

  class Gold < Material
    def cost_multiplier
      2.5
    end
  end

  class Pearl < Material
    def cost_multiplier
      2.3
    end
  end

  class Emerald < Material
    def cost_multiplier
      2.5
    end
  end

  class Onyx < Material
    def cost_multiplier
      2.6
    end
  end

  class Ruby < Material
    def cost_multiplier
      2.8
    end
  end

  class Sapphire < Material
    def cost_multiplier
      3.1
    end
  end

  class Diamond < Material
    def cost_multiplier
      3.5
    end
  end

  class Crystal < Material
    def cost_multiplier
      3.2
    end
  end
end
