module Dragon
  class Area < Place
    attr_accessor :city

    def initialize
      super(Name.generate)
    end

    def self.generate(city, type=types.sample)
      klass = type
      area = klass.new
      area.city = city
      city.areas << area
      area
    end

    def self.generate_list(city, n)
      classes = required_types + types_for_discovery.shuffle
      areas = classes.take(n).map(&:new)

      areas.each do |area|
        area.city = city
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
      "#{name} #{type}"
    end

    def populated?
      false
    end

    def self.types
      [ Square, Forest, Lake, Cave ]
    end

    def self.required_types
      [ Square ]
    end

    def self.types_for_discovery
      [ Forest, Lake, Cave ]
    end
  end

  class Square < Area
    def can_wander?
      false
    end

    def populated?
      true
    end

    def name
      city.name
    end
  end

  class Forest < Area; end
  class Lake < Area; end
  class Cave < Area; end
end
