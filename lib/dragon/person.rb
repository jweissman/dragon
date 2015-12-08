module Dragon
  class Person < Combatant
    include Dragon::Activities
    include Dragon::Questions

    attr_accessor :name, :profession
    attr_accessor :gender, :age, :race, :subtype

    attr_accessor :activity

    def self.generate(
      name: Name.generate, 
      profession: Profession.all.sample,
      age: (20..65).to_a.sample,
      race: races.sample,
      subtype: subtypes.sample
    )
      person = new(name)
      person.profession = profession.new
      person.gender = %w[ male female other ].sample
      person.race = races.sample
      person.subtype = subtypes.sample
      person
    end

    def label
      "#{profession.type} #{name}"
    end

    def describe
      "#{name.capitalize}, a #{subtype} #{race} #{profession.type}, who is #{activity.describe}"
    end

    def activity
      @activity ||= activities.sample.new
    end

    def activities
      base = [ Resting, Reading ]

      professional = if profession.is_a?(Bard)
                       [PlayingMusic, Singing]
                     elsif profession.is_a?(Gambler)
                       [ThrowingDice]
                     elsif profession.is_a?(Jester)
                       [Juggling]
                     else
                       []
                     end

      base + professional
    end

    def conversation_topics
      profession.conversation_topics
    end

    def self.generate_list(professions)
      professions.zip(names.shuffle).collect { |p,n| generate(n, p) }
    end

    
    def self.races
      %w[ human elf dwarf halfling gnome orc goblin centaur ]
    end

    def self.subtypes
      %w[ wild mutant dark light sea forest sky weird quiet ]
    end

    def actions(player)
      quests = player.quests.select { |q| q.requestor == self }
      if quests.any?
        completed = quests.select(&:completed?)
        if completed.any?
          completed.map do |quest|
            Dragon::Commands::RedeemQuestCommand.new(quest: quest)
          end
        else
          []
        end
      else
        []
      end
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
      [ ]
    end
  end
end
