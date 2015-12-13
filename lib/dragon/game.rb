module Dragon
  class Game
    attr_reader :world, :player, :scene, :city, :current_place

    def initialize(
      world: World.new,
      player: PlayerCharacter.new,
      scene: Dragon::Scenes::Welcome.new(game: self),
      city: world.cities.sample,
      place: city.areas.sample
    )
      @world         = world
      @player        = player
      @scene         = scene
      @city          = city

      @current_place = place
      @playing = true
    end

    def actions(place, last_events)
      if event_actions(last_events).any?
        event_actions(last_events)
      else
        scene.actions(place)
      end
    end

    def event_actions(events)
      events.map(&:actions).flatten.compact
    end

    def still_playing?
      @playing
    end

    def transition_to(scene)
      @scene = scene
    end

    def move_to(place)
      @current_place = place
    end

    def travel_to(new_city)
      @city = new_city
      @current_place = new_city.common_areas.sample
    end
  end
end
