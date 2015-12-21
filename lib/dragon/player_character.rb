module Dragon
  class PlayerCharacter < Person
    include Activities

    extend Forwardable
    def_delegators :engine, :place

    attr_accessor :action, :inventory, :engine,
      :quests, :gold, :xp

    def initialize(name=nil, *args)
      @quests = []
      @gold   = 250
      @xp     = 1_000
      @profession = Profession.adventuring.sample.new

      super(name, *args)
    end

    def self.generate(profession: Profession.adventuring.sample)
      super(profession: profession)
    end

    def chance_of_hitting(*)
      0.8
    end

    def attack_rating
      8
    end

    def defense_rating
      4
    end

    def label
      "#{name} the #{profession.type}"
    end

    def describe
      "#{name.capitalize}, the #{race} #{profession.type}"
    end

    def max_hp
      @max_hp ||= profession.default_max_hp
    end

    def inventory
      @inventory ||= []
    end

    def activity
      @activity ||= Exploring.new
    end

    def narrator(terminal)
      @narrator ||= PlayerNarrator.new(self, terminal: terminal)
    end

    def self.professions
      Profession.adventuring
    end
  end
end
