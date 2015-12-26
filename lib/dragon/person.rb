module Dragon
  class Person < Creatures::Hominid
    include Activities
    include Questions
    include Professions
    include Dragon::Helpers::CommandHelpers

    extend Forwardable

    attr_accessor :name, :profession
    attr_accessor :gender, :age, :race, :subtype
    attr_accessor :activity

    def initialize(name, profession=Profession.available.sample, race=Race.types.sample)
      @profession = profession.new(self)
      @race = race.new
      super(name, subtype: Subtype.generate_for(@race))
    end

    def self.generate(
      name: Name.generate,
      profession: Profession.available.sample,
      age: (20..65).to_a.sample,
      race: Race.types.sample
    )
      person         = new(name, profession, race)
      person.gender  = %w[ male female other ].sample
      person.age     = age
      person
    end

    def self.generate_list(professions)
      professions.zip(names.shuffle).collect { |p,n| generate(n, p) }
    end

    def label
      "#{profession.type} #{name}"
    end

    def describe(*)
      "#{name.capitalize}, a #{subtype} #{race} #{profession}, who is #{activity.describe}"
    end

    def default_weapon
      @default_weapon ||= profession.default_weapon || super
    end

    def unarmed_weapon
      @unarmed_weapon ||= Fists.new
    end

    def unarmed_armor
      @unarmed_armor ||= Skin.new
    end

    def conversation_topics
      profession.conversation_topics
    end

    def actions(player)
      completed_quests_for(player).map { |quest| redeem_quest quest }
    end

    def completed_quests_for(player)
      player.quests.
        select { |q| q.requestor == self }.
        select(&:completed?)
    end

    def questions(place)
      general_questions(place) + professional_questions + activity_questions
    end

    def general_questions(place)
      [
        AskAboutPlace.new(place: place),
        AskAboutWork.new(profession: profession),
        AskAboutLife.new
      ]
    end

    def professional_questions
      profession.questions(self)
    end

    def activity_questions
      []
    end

    def activity
      @activity ||= activities.sample.new
    end

    def activities
      base = [ Resting, Reading ]
      base + profession.activities
    end

    def base_modifier
      super + 
        race.base_modifier +
        profession.base_modifier
    end

    def calm_modifier
      super +
        race.calm_modifier +
        profession.calm_modifier
    end

    def focus_modifier
      super +
        race.focus_modifier +
        profession.focus_modifier
    end

    def intellect_modifier
      super + 
        race.intellect_modifier +
        profession.intellect_modifier
    end

    def coordination_modifier
      super + 
        race.coordination_modifier +
        profession.coordination_modifier
    end

    def resilience_modifier
      super + 
        race.resilience_modifier +
        profession.resilience_modifier
    end

    def power_modifier
      super +
        race.power_modifier +
        profession.power_modifier
    end
  end
end
