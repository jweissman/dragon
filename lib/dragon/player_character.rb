module Dragon
  class PlayerCharacter < Person
    include Activities
    include Materials

    extend Forwardable
    def_delegators :profession, :level, :xp_for_upgrade

    attr_accessor :action, :engine, :quests, :gold, :xp

    def initialize(name=Name.generate,
                  profession=Profession.adventuring.sample,
                  *args)
      @quests = []
      @gold   = initial_gold
      @xp     = 0

      super(name, profession, *args)
    end

    def initial_gold
      200
    end

    def score
      gold_score = gold > initial_gold ? (gold-initial_gold) : 0
      xp + (gold_score / 4)
    end

    def accessories
      @accessories ||= Accessory.types.
        map { |t| { t.new.type => [t.new(material: default_accessory_material_for(t))] } }.
        reduce(&:merge)
    end

    def default_accessory_material_for(type)
      return Iron.new if type == Ring || type == Necklace || type == Helm
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

    def self.default_weapon_material
      Iron.new
    end

    def self.generate(profession: Profession.adventuring.sample)
      super(profession: profession)
    end
  end
end
