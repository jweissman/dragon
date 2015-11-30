module Dragon
  class Building < Place
    attr_accessor :town, :aspect

    def self.generate(town, name=names.sample)
      building = new(name)
      building.town = town
      building.aspect = aspects.sample
      building
    end

    def self.generate_list(town, n)
      ns = names.sample(n)
      ns.map { |name| generate(town, name) }
    end

    def describe
      "#{aspect} #{name}"
    end

    def rooms
      @rooms ||= Room.generate_list(self, 2)
      # Array.new(4) do
      #   Room.generate(self)
      # end
    end

    def self.names
      %w[ house library tavern ]
    end

    def self.aspects
      %w[ red large small dingy palatial glorious quaint modern ]
    end
  end

  # class House < Building; end
  # class Library < Building; end
  # class Tavern < Building; end
end

