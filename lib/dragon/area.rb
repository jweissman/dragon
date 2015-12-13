module Dragon
  class Area < Place
    include Professions

    attr_accessor :city

    def initialize
      super(Name.generate)
    end

    def generate_people
      if self.class.populated?
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

    def people
      @people ||= generate_people
    end

    def self.populated?
      false
    end

    def self.common_area?
      false
    end

    def self.can_wander?
      true
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

    def self.required_types
      [ types.select(&:common_area?).sample ]
    end

    def self.types_for_discovery
      types.select(&:can_wander?)
    end
  end
end
