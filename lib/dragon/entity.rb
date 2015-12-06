module Dragon
  class Entity
    class << self
      extend Forwardable
      def_delegators :all, :detect, :any?, :each
    end

    attr_reader :name, :id

    def initialize(name='unnamed')
      @name ||= name
      self.class.register(self)
      @id = self.class.all.count
    end

    def self.register(place)
      @_all ||= []
      @_all.push(place)
    end

    def self.all
      @_all ||= []
    end

    def type
      self.class.name.split('::').last
    end

    def describe
      type
    end

    def self.available_types
      types - unique_types_to_exclude
    end

    def self.unique_types_to_exclude
      types.
        select(&:any?).
        select(&:unique?)
    end
  end
end
