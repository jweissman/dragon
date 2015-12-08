module Dragon
  class GameTerminal
    attr_accessor :console

    extend Forwardable
    def_delegators :console, :clear, :say, :hr, :ask, :choose

    def initialize(console)
      @console = console
    end

    def banner
      clear
      hr
      say BANNER 
      hr
      self
    end

    def welcome(player)
      say "Thanks for playing Dragon, #{player.name}!"
      
      self
    end

    def choose_action(player: nil, actions: nil)
      labels = Hash[actions.zip(actions.map(&:label))]

      choose :action, 
        of: player,
        prompt: PLAYER_ACTION_PROMPT,
        choices: actions, 
        labels: labels

      self
    end
  end
end
