module Dragon
  class PlayerCharacter < Person
    include Activities

    extend Forwardable
    def_delegators :engine, :place

    def_delegators :profession, :base_range, :level, :xp_for_upgrade,
      :power_range, :intellect_range, :coordination_range,
      :resilience_range, :focus_range, :calm_range

    attr_accessor :action, :inventory, :engine,
      :quests, :gold, :xp

    def initialize(name=nil, *args) #Name.generate, *args)
      @quests = []
      @gold   = 200
      @xp     = 0
      @profession = Profession.adventuring.sample.new

      super(name, *args)
    end

    def self.generate(profession: Profession.adventuring.sample)
      super(profession: profession)
    end

    def chance_of_hitting(*)
      0.8
    end

    def label
      "#{name} the #{profession.type}"
    end

    def describe
      "#{name.capitalize}, a lvl-#{level} #{subtype} #{race} #{profession.type}"
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
