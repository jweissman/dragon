module Dragon
  class PlayerCharacter < Person
    include Activities

    extend Forwardable
    def_delegators :engine, :place

    def_delegators :profession, :level, :xp_for_upgrade

    attr_accessor :action, :engine, :quests, :gold, :xp

    def initialize(name=Name.generate, 
                  profession=Profession.adventuring.sample,
                  *args)
      @quests = []
      @gold   = 2_000
      @xp     = 0

      super(name, profession, *args)
    end

    def self.generate(profession: Profession.adventuring.sample)
      super(profession: profession)
    end

    def accessories
      @accessories ||= Accessory.types.
        map { |t| { t.new.type => [t.new(material: default_material_for(t))] } }.
        reduce(&:merge)
    end

    def default_material_for(type)
      return Iron.new if type == Ring || type == Necklace # || type == Helm
      Leather.new
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

    def activity
      @activity ||= Exploring.new
    end

    def narrator
      @narrator ||= PlayerNarrator.new(self)
    end

    def self.professions
      Profession.adventuring
    end
  end
end
