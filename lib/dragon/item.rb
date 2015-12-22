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

  class Poor < Quality
    def cost_multiplier
      0.8
    end
  end

  class Mediocre < Quality; end

  class Good     < Quality
    def cost_multiplier
      1.3
    end
  end

  class Fine < Quality
    def cost_multiplier
      1.6
    end
  end

  class Superior < Quality
    def cost_multiplier
      2.2
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

    def self.generate(exclude_types: [])
      included_types = node_types.reject do |type|
        if exclude_types.empty?
          false
        else
          exclude_types.any? do |excluded|
            type.new.is_a?(excluded)
          end
        end
      end

      included_types.sample.new
    end

    def self.qualities
      [ Inferior, Mediocre, Good, Superior ]
    end

    def self.materials
      [] # override..
    end

    # def self.colors
    #   Color.all
    # end
  end
end
