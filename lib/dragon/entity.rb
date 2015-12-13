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

    def self.categories
      types(exclude_nodes: true, nodes_only: false)
    end

    def self.types(nodes_only: true, exclude_nodes: false)
      descendants = []
      ObjectSpace.each_object(singleton_class) do |k|
        descendants.unshift k unless k == self || (nodes_only && k.types.any?) || (exclude_nodes && !k.types.any?)
      end
      descendants
    end
  end
end
