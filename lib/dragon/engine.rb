module Dragon
  class Engine
    include Dragon::Scenes

    extend Forwardable

    def_delegators :player, :action, :inventory
    def_delegators :terminal, :choose_action, :say
    def_delegators :scene, :actions, :handle

    attr_reader :world, :player, :terminal, :last_prompted_actions

    attr_reader :last_command
    attr_accessor :last_events, :last_destination

    def initialize(terminal: nil, world: World.new, player: PlayerCharacter.new)
      @terminal = terminal
      @world    = world
      @player   = player

      @playing  = true
      @last_prompted_actions = nil

      @last_events = []
      @last_command = nil

      @last_destination  = nil
    end

    def step
      describe
      interact
      self
    end

    def interact
      prompt_player
      react(action)
    end

    def describe(deep: true)
      if scene.squelch_narration?
        narrator.dramatize_scene(scene)
      else
        narrator.dramatize(deep: deep)
      end
    end

    def prompt_player
      @last_prompted_actions = actions(place)
      choose_action player: player, actions: @last_prompted_actions
    end

    def react(act)
      @last_command = act
      handle action: act

      @last_events += process(last_events)

      self
    end

    def process(events)
      additional_events = []

      events.flatten.compact.each do |event|
        if player.quests.any?
          player.quests.each do |q|
            additional_events << q.receive(event)
          end
        end

        # binding.pry

        if event.class.listener(self)
          additional_events << event.class.listener(self).on(event)
        end
      end

      additional_events
    end

    def welcome
      Welcome.new(engine: self)
    end

    def exploration
      Exploration.new(engine: self)
    end

    def conversation_with(partner)
      Conversation.new(engine: self).with(partner: partner)
    end

    def combat_with(enemy)
      Combat.new(engine: self).with(enemy: enemy)
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

    def travel_to(new_city)
      @city = new_city
      @current_place = new_city.areas.select(&:common_area?).sample
    end

    def still_playing?
      @playing
    end

    def city
      @city ||= world.cities.sample
    end

    def place
      @current_place ||= city.areas.sample #random_place
    end

    def scene
      @current_scene ||= welcome
    end

    def narrator
      Narrator.new(terminal: terminal, world: world, city: city, place: place, scene: scene, player: player)
    end
  end
end
