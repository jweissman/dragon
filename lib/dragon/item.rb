module Dragon
  class Item < Entity
    attr_reader :quality, :kind, :cost

    def initialize(name, kind: nil, quality: nil, cost: 1)
      @kind = kind
      @quality = quality
      @cost = cost

      super(name)
    end

    def describe
      "#{quality} #{kind}"
    end

    def label
      describe
    end

    def self.generate
      new('unnamed', kind: kinds.sample, quality: qualities.sample)
    end

    def self.kinds
      %w[ ring helm staff coin figurine gem ]
    end

    def self.qualities
      %w[ broken new shiny glittering ancient old dusty engraved  
          red green purple blue yellow orange white ]
    end
  end
end
