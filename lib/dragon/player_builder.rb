module Dragon
  class PlayerBuilder
    attr_reader :console

    def initialize(console)
      @console = console
    end

    def character_for(player)
      ask_name player

      console.ask :age,    of: player
      console.ask :gender, of: player

      choose_subtype player
      choose_race    player
      choose_job     player

      player
    end

    protected

    def ask_name(player)
      console.ask :name, of: player, prompt: PLAYER_NAME_PROMPT
    end

    def choose_job(player)
      console.choose :profession, of: player,
        prompt: PLAYER_TYPE_PROMPT,
        choices: PlayerCharacter.professions
    end

    def choose_race(player)
      console.choose :race, of: player,
        prompt: PLAYER_RACE_PROMPT,
        choices: Person.races
    end

    def choose_subtype(player)
      console.choose :subtype, of: player, 
        prompt: PLAYER_SUBTYPE_PROMPT,
        choices: Person.subtypes
    end

    def self.construct(klass, console: Console.new)
      console.say "Let's get to know a little about you...", 
        heading: true

      builder = new(console)
      player = builder.character_for(klass.new(''))

      console.say "Okay, that's enough! Let's get moving.", 
        important: true
      player
    end
  end
end
