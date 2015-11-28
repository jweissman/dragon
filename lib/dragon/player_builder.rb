module Dragon
  class PlayerBuilder
    attr_reader :console

    def initialize(console)
      @console = console
    end

    def character(player)
      ask_name player

      choose_job player

      choose_race player
      choose_subtype player

      console.ask :age,    of: player
      console.ask :gender, of: player

      player
    end

    protected

    def ask_name(player)
      console.ask :name, of: player, prompt: PLAYER_NAME_PROMPT
    end

    def choose_job(player)
      console.choose :job, of: player, 
        prompt: PLAYER_TYPE_PROMPT,
        choices: PlayerCharacter::JOBS
    end

    def choose_race(player)
      console.choose :race, of: player,
        prompt: PLAYER_RACE_PROMPT,
        choices: PlayerCharacter::RACES
    end

    def choose_subtype(player)
      console.choose :subtype, of: player, 
        prompt: PLAYER_SUBTYPE_PROMPT,
        choices: PlayerCharacter::SUBTYPES
    end

    def self.construct(klass, term=Console.new)
      term.say "Let's get to know a little about you..."
      player = new(term).character(klass.new)
      term.say "Okay, that's enough! Let's get moving."
      player
    end
  end
end
