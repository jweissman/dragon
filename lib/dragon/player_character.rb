module Dragon
  class PlayerCharacter < Person
    extend Forwardable
    def_delegators :engine, :place

    attr_accessor :action, :inventory, :engine
    
    def initialize(name=nil)
      super(name)
    end

    def max_hp
      @max_hp ||= PlayerCharacter.default_max_hp_for(profession: profession)
    end

    def attack_rating
      5
    end

    def defense_rating
      2
    end

    def inventory
      @inventory ||= []
    end

    def activity
      @activity ||= :exploring
    end

    def self.professions
      %w[ warrior wizard soldier rogue cleric ]
    end

    def self.default_max_hp_for(profession: nil)
      {
        warrior: 25,
        wizard: 8,
        soldier: 20,
        rogue: 15,
        cleric: 12
      }[profession.to_sym]
    end
  end
end
