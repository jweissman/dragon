module Dragon
  class Person < Entity
    attr_accessor :name, :profession
    attr_accessor :gender, :age, :race, :subtype

    attr_accessor :activity

    def self.generate(
      name: Name.generate, 
      profession: professions.sample
    )
      person = new(name)
      person.profession = profession
      person.gender = %w[ male female other ].sample
      person.race = races.sample
      person.subtype = subtypes.sample
      person
    end

    def activity
      @activity ||= activities.sample
    end

    def activities
      base = [ :sitting, :resting, :reading ]
      professional = if profession == 'bard'
                       [:playing_music]
                     elsif profession == 'gambler'
                       [:throwing_dice]
                     else
                       []
                     end

      base + professional
    end

    def self.generate_list(professions)
      professions.zip(names.shuffle).collect { |p,n| generate(n, p) }
    end

    def describe
      "#{name.capitalize}, a #{subtype} #{race} #{profession}, who is #{activity}"
    end

    def self.races
      %w[ human elf dwarf halfling gnome orc ]
    end

    def self.subtypes
      %w[ wild mutant dark light sea forest sky weird quiet ]
    end

    def self.professions
      %w[ wife child husband grandmother professor student scribe professor
          reader barkeep drunk waiter gambler bard ]
    end

    def conversation_topics(place)
      general_topics(place) + activity_topics
    end

    def general_topics(place)
      [ 
        ConversationAboutPlace.new(place: place),
        ConversationAboutWork.new(profession: profession),
        ConversationAboutLife.new
      ]
    end

    def activity_topics
      if activity == :playing_music
        [ AskToStopPlayingMusic.new ]
      elsif profession == 'bard'
        [ AskToPlayMusic.new ]
      else
        []
      end
    end
  end
end
