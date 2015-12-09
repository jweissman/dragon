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

    def dramatize(deep: true)
      dramatize_scene(scene) if scene

      if deep
        dramatize_world if world
        describe city,  prefix: "You are visiting " if city
      end

      dramatize_place(place) if place
      dramatize_player if player
    end

    def describe(entity, prefix: '', suffix: '', important: false, heading: false)
      description = add_period_if_missing(prefix + entity.describe + suffix)
      say capitalize_first_word(description), important: important, heading: heading
    end

    def dramatize_world
      if player
        describe player, prefix: "You are "
      end

      describe world, prefix: "You are in the world of "
    end

    def dramatize_player
      if player.inventory.any?
        inventory_description = player.inventory.map(&:describe).join(', ')
        say "Your inventory includes: #{inventory_description}."
      end

      if player.quests.any?
        quest_description = player.quests.map(&:describe).join(', ')
        say "Your quests include #{quest_description}."
      end

      if player.gold > 0
        say "You have #{player.gold} gold pieces"
      end
    end

    def dramatize_scene(scene)
      describe scene, prefix: "You are ", heading: true

      unless scene.last_command || scene.last_events.any?
        say scene.default_narration
      end

      command = scene.last_command
      if command
        describe command, important: true
      end

      events = scene.last_events
      dramatize_events(events, scene) if events.any?
    end

    def dramatize_events events, scene
      if events.any?
        news = events.flatten.compact
        news.each do |event|
          if scene.permit_delays?
            simulate_delay_for_dramatic_purposes if news.length > 1
          end

          describe event, important: true if event.describe?
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

    def add_period_if_missing(sentence)
      unless punctuation.include?(sentence.chars.last)
        sentence += '.'
      end

      sentence
    end

    def punctuation
      %w[ . ? ! ' " ]
    end

    def simulate_delay_for_dramatic_purposes
      sleep(0.7) unless under_test?
    end
  end
end
