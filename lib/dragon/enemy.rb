module Dragon
  class Enemy < Entity
    attr_reader :species

    def initialize(name, species: nil)
      @species = species
    end

    def describe
      species
    end

    def self.generate
      new('unnamed', 
        species: species_list.sample)
    end

    def self.species_list
      %w[ rat snake wolf ]
    end
  end
end
