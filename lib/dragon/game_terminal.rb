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
      say prefix + entity.describe + suffix + '.'
    end

    def narrate(world: nil, town: nil, place: nil, scene: nil)
      hr
      puts

      describe world, prefix: "You are in the world of " if world
      describe town,  prefix: "The town you are in currently is " if town

      puts
      hr light: true
      puts

      narrate_place(place) if place
      narrate_scene(scene) if scene

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

      say scene.last_action, heading: true if scene.last_action
      say scene.last_response, heading: true if scene.last_response
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
