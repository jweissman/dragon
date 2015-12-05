module Dragon
  class Entity
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

    def describe
      label
    end
  end
end
