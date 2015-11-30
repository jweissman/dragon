module Dragon
  class Entity
    attr_reader :name, :id

    def initialize(name='unnamed')
      @name ||= name
      Entity.register(self)
      @id = Entity.all.count
    end

    class << self
      def register(place)
        @_all ||= []
        @_all.push(place)
      end

      def all
        @_all ||= []
      end
    end

    def describe
      label
    end

    def label
      name.to_s.
        gsub('_', ' ').
        split(' ').
        map(&:capitalize).
        join(' ')
    end
  end
end
