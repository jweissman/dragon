module Dragon
  class Enemy < Combatant
    attr_reader :species, :subtype

    def initialize(name, species: nil, subtype: nil)
      @species = species
      @subtype = subtype
    end

    def self.generate
      new('unnamed', 
        species: species_list.sample,
        subtype: subtypes.sample)
    end

    def attack_rating
      6
    end

    def defense_rating
      2
    end

    def max_hp
      @map_hp ||= Enemy.max_hp_for_species(species)
    end

    def describe
      "#{subtype} #{species}"
    end

    def self.species_list
      %w[ rat snake wolf slime ]
    end

    def self.max_hp_for_species(species)
      {
        rat: 5,
        snake: 6,
        wolf: 8,
        slime: 12
      }[species.to_sym]
    end

    def self.subtypes
      %w[ mutant forest feral angry weird uncanny toxic glowing strange ]
    end
  end
end
