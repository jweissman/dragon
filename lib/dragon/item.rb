module Dragon
  class Item < Entity
    attr_reader :quality, :cost, :material

    def initialize(name=nil,
                   quality:  self.class.qualities.sample.new,
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
      content = "#{quality.describe} #{material.describe} #{labelized_type}"
      (prefix.nil? ? '' : (prefix+' ')) + content
    end

    def self.generate(exclude_types: [], only_types: [])
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

      included_types.sample.new
    end

    def self.qualities
      Quality.types
      # [ Inferior, Mediocre, Good, Superior ]
    end

    def self.materials
      [] # override..
    end


    # def self.colors
    #   Color.all
    # end
  end
end
