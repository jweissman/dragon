module Dragon
  class GameNarrator < Narrator
    extend Forwardable

    def_delegators :model, :scene, :player, :world, :city
    def_delegator :model, :current_place, :place

    def narrate(last_command, last_events)
      narrate_scene(last_command, last_events)
      narrate_player if player
    end

    protected
    def deep?
      scene.deep_narration?
    end

    def narrate_player
      narrator_for(player).narrate(
        display_gold:   scene.show_gold?,
        display_quests: scene.show_quests?,
        display_items:  scene.show_items?
      )
    end

    def narrate_scene(last_command, last_events)
      narrator_for(scene).narrate(last_command, last_events)
      narrate_surroundings
    end

    def narrate_surroundings
      narrate_world_and_city if deep?
      narrate_place if deep?
    end

    def narrate_world_and_city
      narrate_world
      narrate_city
    end

    def narrate_world
      world.narrator(terminal).narrate if world
    end

    def narrate_city
      city.narrator(terminal).narrate if city
    end

    def narrate_place
      place.narrator(terminal).narrate if place
    end

    private
    def narrator_for(object)
      object.narrator(terminal)
    end
  end
end

