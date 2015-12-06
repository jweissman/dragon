module Dragon
  class Narrator
    extend Forwardable
    def_delegators :terminal, :say

    attr_reader :terminal, :world, :city, :place, :scene, :player

    def initialize(terminal: nil, world: nil, city: nil, place: nil, scene: nil, player: nil)
      @terminal = terminal

      @world  = world
      @city   = city
      @place  = place
      @scene  = scene
      @player = player
    end

    def dramatize

      if scene
        dramatize_scene scene
      end

      describe world, prefix: "You (#{player.describe}) are in the world of " if world
      describe city,  prefix: "You are visiting " if city

      dramatize_place(place) if place

      if player.inventory.any?
        say "Your inventory includes: "
        player.inventory.each do |item|
          describe item, prefix: " - A "
        end
      end

    end

    def describe(entity, prefix: '', suffix: '', important: false, heading: false)
      description = prefix + entity.describe + suffix + '.'
      say capitalize_first_word(description), important: important, heading: heading
    end

    def dramatize_scene(scene)
      command = scene.last_command
      if command
        describe command, heading: true
      end
       
      events = scene.last_events
      dramatize_events(events) if events.any?

      describe scene, prefix: "You are currently "
    end

    def dramatize_events events
      if events.any?
        news = events.flatten.compact
        news.each do |event|
          simulate_delay_for_dramatic_purposes if news.length > 1
          describe event, important: true
        end
      end
    end

    def dramatize_place(place)
      place_preposition = if place.is_a?(Room)
                            'in'
                          elsif place.is_a?(Area)
                            'wandering near'
                          elsif place.is_a?(Building)
                            'at'
                          end

      if place.is_a?(Room)
        describe place, prefix: "You are #{place_preposition} the ", suffix: " of a #{place.building.describe}" 
      else
        describe place, prefix: "You are #{place_preposition} the "
      end

      if place.people.any?
        say "There are people here."

        place.people.each do |person|
          describe person, prefix: "There is a person "
        end
      end
    end

    private
    def capitalize_first_word(sentence)
      words = sentence.split(' ')
      first = words.first.capitalize
      rest  = words[1..-1]

      [first, rest].flatten.join(' ')
    end

    def simulate_delay_for_dramatic_purposes
      sleep 1.0
    end
  end
end
