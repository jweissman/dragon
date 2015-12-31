module Dragon
  class Material
    include Materials

    def cost_multiplier
      1.0
    end

    def describe
      self.class.name.split('::').last.downcase
    end

    def self.basic
      [ Wood, Stone ]
    end

    def self.metallic
      [ Iron, Steel ]
    end

    def self.precious
      [ Copper, Silver, Gold ]
    end

    def self.gemstone
      [ Ruby, Pearl, Sapphire, Onyx, Emerald, Diamond ]
    end

    def strength_modifier
      strength.modifier
    end

    def strength
      @strength ||= material_strength.new
    end

    def material_strength
      raise "override Material#material_strength in #{self.class.name}"
    end
  end
end
