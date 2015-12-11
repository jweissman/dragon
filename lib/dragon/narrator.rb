require 'dragon/narration/exposition'

module Dragon
  class Narrator
    include Narration::Exposition
    extend Forwardable

    def_delegators :terminal, :say

    attr_reader :terminal, :world, :city, :place, :scene, :player

    def initialize(terminal: nil, world: nil, city: nil, place: nil, scene: nil, player: nil)
      @terminal = terminal
      @world    = world
      @city     = city
      @place    = place
      @scene    = scene
      @player   = player
    end

    def dramatize(deep: false)
      dramatize_scene(scene) if scene
      dramatize_surroundings(deep: deep)
      dramatize_player(deep: deep) if player
    end

    def dramatize_surroundings(deep: false)
      if deep && world
        dramatize_world
      end

      describe city,  prefix: "You are visiting "
      dramatize_place(place)
    end

    def dramatize_world(deep: false)
      describe world, prefix: "You are in the world of "
    end

    def dramatize_player(deep: false, display_gold: true, display_quests: true, display_items: true)
      if display_items && player.inventory.any?
        inventory_description = player.inventory.map(&:describe).join(', ')
        say "You have #{player.gold} gold pieces, and your inventory includes: #{inventory_description}"
      else
        say "You have #{player.gold} gold pieces."
      end

      if display_quests && player.quests.any?
        quest_description = player.quests.map(&:describe).join(', ')
        say "Your quests include #{quest_description}"
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
        describe place,
          prefix: "You are #{place_preposition} the ",
          suffix: " of a #{place.building.describe}"
      else
        describe place, prefix: "You are #{place_preposition} the "
      end

      if place.people.any?
        descriptor = describe_number_of_people(place.people.count)

        say "There #{descriptor} here: #{describe_people(place.people)}."
      end
    end

    def simulate_delay_for_dramatic_purposes
      sleep(0.7) unless under_test?
    end
  end
end
