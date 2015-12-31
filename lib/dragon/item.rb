module Dragon
  class Item < Entity
    include Dragon::Materials

    attr_reader :quality, :cost, :material

    def initialize(name=nil,
                   quality:  Normal.new,
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

    def describe(prefix: nil)
      content = if quality.is_a?(Normal)
        "#{material.describe} #{labelized_type}"
      else
        "#{quality.describe} #{material.describe} #{labelized_type}"
      end

      (prefix.nil? ? '' : (prefix+' ')) + content
    end

    def self.generate(exclude_types: [], only_types: [], material: nil)
      not_excluded_types = node_types.reject do |type|
        if exclude_types.empty?
          false
        else
          exclude_types.any? do |excluded|
            type.new.is_a?(excluded)
          end
        end
      end

      included_types = not_excluded_types.select do |type|
        if only_types.empty?
          true
        else
          only_types.any? do |included|
            type.new.is_a?(included)
          end
        end
      end

      type = included_types.sample
      material ||= type.materials.sample.new

      type.new material: material
    end

    def self.qualities
      Quality.types
    end

    def self.materials
      [ Wood, Stone ]
    end
  end
end
