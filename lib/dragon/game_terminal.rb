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
      say "Thanks for playing Dragon, #{player.label}!"
      self
    end

    def describe(entity, prefix: '', suffix: '')
      description = prefix + entity.describe + suffix # + '.'
      say description
    end

    def narrate(world: nil, town: nil, place: nil, scene: nil, player: nil)
      hr
      puts

      describe world, prefix: "You (#{player.name}) are in the world of " if world
      describe town,  prefix: "The town you are in currently is " if town

      puts
      hr light: true
      puts

      if scene
        describe scene.last_command if scene.last_command
        describe scene.last_event   if scene.last_event

        narrate_scene(scene) 
      end

      narrate_place(place) if place

      if player.inventory.any?
        say "Your inventory includes: "
        player.inventory.each do |item|
          describe item, prefix: " - A "
        end
      end

      puts

      self
    end

    def choose_action(player: nil, actions: nil)
      choose :action, of: player,
        prompt: PLAYER_ACTION_PROMPT,
        choices: actions, 
        labels: Hash[actions.zip(actions.map(&:label))]

      self
    end

    protected

    def narrate_scene(scene)
      describe scene, prefix: "You are currently "
    end

    def narrate_place(place)
      place_preposition = if place.is_a?(Room)
                            'in'
                          elsif place.is_a?(Area)
                            'wandering near'
                          elsif place.is_a?(Building)
                            'at'
                          end

      if place.is_a?(Room)
        describe place, prefix: "You are #{place_preposition} a ", suffix: " inside a #{place.building.describe}" 
      else
        describe place, prefix: "You are #{place_preposition} a "
      end

      if place.people.any?
        say "There are people here."

        place.people.each do |person|
          describe person, prefix: "There is a person "
        end
      end
    end
  end
end
