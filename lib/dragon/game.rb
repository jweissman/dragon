module Dragon
  class Game
    extend Forwardable
    def_delegators :console, :say, :ask, :choose, :banner, 
                             :welcome, :narrate

    def boot!
      banner and play
      say 'Thanks for playing!'
    end

    def play
      welcome player
      step while still_playing?
    end

    def step
      narrate world: world, town: town
      interact
    end

    def interact
      choose_action
      handle player.action
      puts
    end

    protected
    def choose_action
      choose :action, of: player,
        prompt: PLAYER_ACTION_PROMPT, 
        choices: available_actions.keys,
        labels: available_actions
    end

    def available_actions
      { 
        chew_bubble_gum: "Chew some bubble gum, man", 
        gather_rumours: "Gather up those rumors", 
        shake_it: "Shake it (without breaking it)", 
        quit: "Leave all this behind" 
      }
    end

    def handle(action)
      response = if action == :gather_rumours
                   'There are no rumors to gather!'
                 elsif action == :chew_bubble_gum
                   'There is not even bubble gum!'
                 elsif action == :quit
                   'Well bye!'
                 else
                   'Hmm, it did not seem to work!'
                 end

      say response, heading: true, important: true
    end

    private
    def world
      @world ||= World.new "Heraldia", 'Plane', 'Fateful', 'Dreams'
    end

    def player
      @player ||= PlayerCharacter.build(console)
    end

    def town
      @town ||= Town.new 'Ur', 'Imperial', 'Secret Police'
    end

    def console
      @console ||= GameTerminal.new
    end

    def still_playing?
      player.action != :quit
    end
  end
end
