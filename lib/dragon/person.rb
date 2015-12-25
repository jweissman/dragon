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

    def self.generate(
      name: Name.generate,
      profession: Profession.available.sample,
      age: (20..65).to_a.sample,
      race: Race.types.sample
    )
      person = new(name)
      person.profession = profession.new
      person.gender     = %w[ male female other ].sample
      person.race       = race.new
      person.subtype    = Subtype.generate_for(person.race)
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
      race.base_modifier + subtype.base_modifier
    end

    def calm_modifier
      race.calm_modifier + subtype.calm_modifier
    end

    def focus_modifier
      race.focus_modifier + subtype.focus_modifier
    end

    def intellect_modifier
      race.intellect_modifier + subtype.intellect_modifier
    end

    def coordination_modifier
      race.coordination_modifier + subtype.coordination_modifier
    end

    def resilience_modifier
      race.resilience_modifier + subtype.resilience_modifier
    end

    def power_modifier
      race.power_modifier + subtype.power_modifier
    end
  end
end
