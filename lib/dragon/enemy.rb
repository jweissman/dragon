module Dragon
  class Enemy < Entity
    attr_reader :species, :hp, :max_hp

    def initialize(name, species: nil, hp: nil)
      @species = species
      @hp = @max_hp = hp
    end

    def xp
      100
    end

    def alive?
      @hp > 0
    end

    def take_damage!(damage)
      @hp -= damage
    end

    def attack_rating
      1
    end

    def defense_rating
      1
    end

    def describe
      "#{species} (#{hp}/#{max_hp})"
    end

    def self.generate
      new('unnamed', 
        species: species_list.sample,
        hp: 10)
    end

    def self.species_list
      %w[ rat snake wolf ]
    end
  end
end
