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

    def self.generate(city, insert: false)
      valid_types = (required_types_for_city(city) +
                     available_types_for_city(city) +
                     types_for_discovery.shuffle).uniq.reject do |type|
        city.areas.any? { |area| area.is_a?(type) }
      end

      klass = valid_types.first

      area = klass.new
      area.city = city
      city.areas << area if insert
      area
    end

    def self.generate_list(n, city: nil)
      valid_types = (required_types_for_city(city) +
                     available_types_for_city(city) +
                     types_for_discovery.shuffle).uniq

      valid_types.take(n).map(&:new).map do |area|
        area.city = city
        area
      end
    end

    def self.required_types_for_city(city)
      required_types # - city.areas.map(&:class)
    end

    def self.required_types
      [ Areas::Square ]
    end

    def self.available_types_for_city(city)
      city.subtype.class.associated(Area) # - city.areas.map(&:class)
    end

    def self.types_for_discovery
      types.select(&:can_wander?)
    end
  end
end
