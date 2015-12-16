module Dragon
  class City < Entity
    include Cities

    attr_accessor :world, :subtype, :feature

    attr_reader :buildings, :areas

    def initialize(name=Name.generate,
                   subtype: nil, feature: nil, world: nil)

      @subtype   = Subtype.generate_for(self)
      @feature   = feature
      @world     = world

      @buildings = []
      building_count.times { @buildings << Building.generate(self) }

      @areas = []
      area_count.times { @areas << Area.generate(self, insert: false) }

      super(name)
    end

    def any_buildings_of_type?(klass)
      buildings.any? && buildings.any? do |building|
        building.is_a?(klass)
      end
    end

    def describe
      "#{name}, #{subtype} #{type} of #{feature.to_s.gsub('_', ' ')}"
    end

    def label
      "#{name} [#{type}]"
    end

    def random_place
      places.sample
    end

    def common_areas
      areas.select { |area| area.class.common_area? }
    end

    def places
      buildings.map(&:rooms).flatten + areas
    end

    def building_count_range
      (3..5)
    end

    def area_count_range
      (2..5)
    end

    def building_count
      @building_count ||= building_count_range.to_a.sample
    end

    def area_count
      @area_count ||= area_count_range.to_a.sample
    end

    def narrator(terminal)
      @narrator ||= CityNarrator.new(self, terminal: terminal)
    end

    def self.generate(world, type = available_city_types.sample)
      city = type.new world: world, feature: features.sample
      city
    end

    def self.available_city_types
      types - types.select(&:unique?).select(&:any?)
    end

    def self.generate_list(n, world: nil)
      type_list = (required_types + types.shuffle).uniq.take(n)
      type_list.map do |type|
        generate(world, type)
      end
    end

    def self.types_for(world)
      required = required_types.reject do |type|
        world.cities.map(&:type).include?(type)
      end

      return required unless required.empty?

      types - excluded_types_for(world)
    end

    def self.excluded_types_for(world)
      types.select(&:any?).select(&:unique?)
    end

    def self.features
      %w[ secret_police dreams love many_goats too_many_books ]
    end

    def self.required_types
      [ Capital ]
    end

    def self.unique?
      false
    end
  end
end

