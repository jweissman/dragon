module Dragon
  class Area < Place
    attr_accessor :town

    def initialize
      super(Name.generate)
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
      @people ||= generate_people
    end

    def generate_people
      if populated?
        Array.new([2,3].sample) { Person.generate }
      else
        []
      end
    end

    def describe
      "#{name} #{label}"
    end

    def label
      self.class.name.split('::').last
    end

    def populated?
      false
    end
  end

  class TownSquare < Area
    def can_wander?
      false
    end

    def populated?
      true
    end
  end

  class Forest < Area; end
  class Lake < Area; end

  AREA_TYPES = [ TownSquare, Forest, Lake ]
end
