module Dragon
  class Area < Place
    attr_accessor :town

    def initialize
      super(names.sample)
    end

    def self.generate(town)
      klass = AREA_TYPES.sample
      area = klass.new
      area.town = town
      area
    end

    def self.generate_list(town, n)
      klasses = AREA_TYPES.sample(n)
      areas = klasses.map(&:new)

      areas.each do |area|
        area.town = town
      end

      areas
    end

    def people
      @people ||= Array.new(1) { Person.generate }
    end

    def describe
      "#{name} #{type_label}"
    end

    def type_label
      self.class.name.split('::').last
    end

    def names
      %w[ oxnard ]
    end
  end

  class TownSquare < Area; end
  class Forest < Area; end
  class Lake < Area; end

  AREA_TYPES = [ TownSquare, Forest, Lake ]
end
