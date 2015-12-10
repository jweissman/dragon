module Dragon
  class Area < Place
    include Dragon::Professions

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
        people_count = population_range.to_a.sample
        professions.take(people_count).map do |job|
          Person.generate profession: job
        end
      else
        []
      end
    end

    def population_range
      (1..3)
    end

    def professions
      Profession.basic.shuffle
    end

    def describe
      "#{name} #{type}"
    end

    def populated?
      false
    end

    def self.types
      [ Square, Alley, Forest, Lake, Cave, Shore, Hill, Swamp ]
    end

    def self.required_types
      [ Square ]
    end

    def self.types_for_discovery
      [ Forest, Lake, Cave, Shore, Hill, Swamp ]
    end
  end

  class Square < Area
    def can_wander?
      false
    end

    def common_area?
      true
    end

    def populated?
      true
    end

    def name
      city.name
    end

    def professions
      [ Trader ] + super
    end
  end

  class Alley < Area; end

  class Forest < Area; end
  class Lake < Area; end
  class Cave < Area; end

  # maybe should be a more 'explorable' building-type
  class Shore < Area; end
  class Swamp < Area; end

  class Hill < Area; end
end
