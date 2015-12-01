module Dragon
  class Engine
    extend Forwardable

    def_delegators :player, :action
    def_delegators :console, :choose_action, :narrate, :say
    def_delegators :scene, :actions, :handle

    attr_reader :world, :player, :console

    def initialize(console: nil, world: nil, player: nil)
      @console = console
      @world   = world
      @player  = player

      @playing = true
    end

    def step
      narrate place: place, scene: scene, town: town, world: world
      interact
      self
    end

    def interact
      choose_action player: player, actions: actions(place)
      handle action: action, place: place
      self
    end

    def initial_scene
      Exploration.new(controller: self)
    end

    def conversation_with(partner)
      Conversation.new(controller: self).with(partner: partner)
    end

    def halt!
      @playing = false
    end

    def transition_to(scene)
      @current_scene = scene
    end

    def move_to(place)
      @current_place = place
    end

    def still_playing?
      @playing
    end

    def town
      @town ||= world.towns.sample
    end

    def place
      @current_place ||= town.random_place
    end

    def scene
      @current_scene ||= initial_scene
    end
  end
end
