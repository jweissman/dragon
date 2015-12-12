module Dragon
  class Entity
    class << self
      extend Forwardable
      def_delegators :all, :detect, :any?, :each
    end

    attr_reader :name, :id

    def initialize(name='unnamed')
      @name ||= name
      @id = self.class.all.count
    end

    def self.all
      ObjectSpace.each_object(self)
    end

    def describe
      return "#{subtype} #{type}" if subtype
      type
    end

    def type
      self.class.name.split('::').last
    end

    def decorate
      @decorator ||= EntityDecorator.new(self)
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
