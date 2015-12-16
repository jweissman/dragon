module Dragon
  class Entity
    extend Taggable

    class << self
      extend Forwardable
      def_delegators :all, :detect, :any?, :each
    end

    attr_reader :name, :id

    def initialize(name=nil)
      @name = name
      @id   = self.class.all.count
    end

    def to_s
      label
    end

    def label
      name || type
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

    def self.categories
      types(exclude_nodes: true, nodes_only: false)
    end

    def self.descendants
      @descendants ||= compute_descendants
    end

    def self.compute_descendants
      descendants = []
      ObjectSpace.each_object(singleton_class) do |k|
        descendants.unshift k unless k == self
      end
      descendants
    end

    def self.types(nodes_only: true, exclude_nodes: false)
      descendants.reject do |k|
        is_a_node = k.types.any?
        (nodes_only && is_a_node) || (exclude_nodes && !is_a_node)
      end
    end

    def self.types_tagged_with(tag)
      types.select { |type| type.tagged_with?(tag) }
    end

    def self.associated(klass)
      associated_classes = tags.map do |tag|
        klass.types_tagged_with(tag)
      end.flatten.uniq

      associated_classes.sort_by do |c|
        c.tags_in_common_with(self)
      end.reverse
    end

    def self.tags_in_common_with(klass)
      (klass.tags - tags).count
    end

    def self.all_tags
      types.map(&:tags).flatten.uniq.sort
    end
  end
end
