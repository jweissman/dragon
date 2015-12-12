module Dragon
  class PlayerCharacter < Person
    extend Forwardable
    def_delegators :engine, :place

    attr_accessor :action, :inventory, :engine,
      :quests, :gold, :xp

    def initialize(name=nil)
      @quests = []

      @gold = 10
      @xp = 0

      super(name)
    end

    def self.generate(
      profession: Profession.adventuring.sample
    )
      super(profession: profession)
    end

    def chance_of_hitting(*)
      0.8
    end

    def label
      "#{name} the #{profession.type}"
    end

    def describe
      "#{name.capitalize}, the #{subtype} #{race} #{profession.type}"
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
      @activity ||= Dragon::Activities::Exploring.new
    end

    def self.professions
      Profession.adventuring
    end

    def self.default_max_hp_for(profession: nil)
      profession.default_max_hp
    end

    def narrator(terminal)
      PlayerNarrator.new(self, terminal: terminal)
    end
  end
end
