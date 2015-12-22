module Dragon
  class Entity
    extend Taggable
    include Aspects

    class << self
      extend Forwardable
      def_delegators :all, :detect, :any?, :each
    end

    attr_reader :name, :id

    def initialize(name=nil)
      @name = name
      @id   = self.class.all.count
    end

    def aspects
      @aspects ||= if AspectGroup.for(self) then AspectGroup.for(self).generate else [] end
    end

    def primary_aspect
      @primary_aspect ||= aspects.sample
    end

    def describe
      "#{primary_aspect.label} #{labelized_type}"
    end

    def to_s
      label
    end

    def label
      name || labelized_type
    end

    def labelized_type
      type.split(/(?=[A-Z])/).compact.map(&:downcase).join(' ')
    end

    def self.all
      ObjectSpace.each_object(self)
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

    def self.node_types
      types(nodes_only: true)
    end

    def self.types_tagged_with(tag)
      types.select { |type| type.tagged_with?(tag) }
    end

    def self.associated(klass)
      klass.sorted_types_by_tags(tags)
    end

    def self.sorted_types_by_tags(*query_tags)
      types = query_tags.flatten.map do |tag|
        types_tagged_with(tag)
      end.flatten.uniq

      types.sort_by do |klass|
        (klass.tags & query_tags).count
      end
    end

    def self.tags_in_common_with(klass)
      (klass.tags - tags).count
    end

    def self.all_tags
      types.map(&:tags).flatten.uniq.sort
    end
  end
end
