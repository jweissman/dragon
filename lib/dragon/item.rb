module Dragon
  class Quality
    def describe
      self.class.name.split('::').last.downcase
    end

    def cost_multiplier
      1.0
    end
  end

  class Inferior < Quality
    def cost_multiplier
      0.5
    end
  end

  class Mediocre < Quality; end
  class Good     < Quality
    def cost_multiplier
      1.3
    end
  end

  class Superior < Quality
    def cost_multiplier
      1.6
    end
  end

  class Material
    def cost_multiplier
      1.0
    end

    def describe
      self.class.name.split('::').last.downcase
    end

    def self.basic
      [ Wood, Iron, Stone, Bronze ]
    end

    def self.metallic
      [ Iron, Bronze, Steel, Gold, Silver, Copper ]
    end

    def self.gemstone
      [ Ruby, Pearl, Sapphire, Onyx, Emerald, Diamond ]
    end
  end

  class Wood < Material
    def cost_multiplier
      0.4
    end
  end

  class Stone < Material
    def cost_multiplier
      0.6
    end
  end

  class Leather < Material
    def cost_multiplier
      0.75
    end
  end

  class Bronze < Material
    def cost_multiplier
      0.8
    end
  end

  class Iron < Material
    def cost_multiplier
      1.0
    end
  end

  class Steel < Material
    def cost_multiplier
      1.8
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

  ####

  class Item < Entity
    attr_reader :quality, :cost, :material

    def initialize(name=nil,
                   quality: self.class.qualities.sample.new,
                   material: self.class.materials.sample.new)
      @material  = material
      @quality   = quality
      super(name)
    end

    def base_cost
      5
    end

    def cost
      raw_cost = (base_cost * material.cost_multiplier * quality.cost_multiplier)
      raw_cost.floor
    end

    def describe
      "#{quality.describe} #{primary_aspect.label} #{material.describe} #{labelized_type}"
    end

    def self.generate
      node_types.sample.new
    end

    def self.qualities
      [ Inferior, Mediocre, Good, Superior ]
    end

    def self.materials
      [] # override..
    end
  end
end
