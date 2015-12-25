module Dragon
  class GameNarrator < Narrator
    extend Forwardable

    def_delegators :model, :scene, :player, :world, :city
    def_delegator :model, :current_place, :place

    def narrate(terminal, last_command, last_events)
      narrate_scene(terminal, last_command, last_events)
      narrate_player(terminal) if player
    end

    protected
    def deep?
      scene.deep_narration?
    end

    def narrate_player(terminal)
      narrator_for(player).narrate(
        terminal,
        display_gold:   scene.show_gold?,
        display_quests: scene.show_quests?,
        display_items:  scene.show_items?
      )
    end

    def narrate_scene(terminal, last_command, last_events)
      narrator_for(scene).narrate(terminal, last_command, last_events)
      narrate_surroundings(terminal) if deep?
    end

    def narrate_surroundings(terminal)
      narrate_world_and_city(terminal)
      narrate_place(terminal)
    end

    def narrate_world_and_city(terminal)
      narrate_world(terminal)
      narrate_city(terminal)
    end

    def narrate_world(terminal)
      world.narrator.narrate(terminal) if world
    end

    def narrate_city(terminal)
      city.narrator.narrate(terminal) if city
    end

    def narrate_place(terminal)
      place.narrator.narrate(terminal) if place
    end

    private
    def narrator_for(object)
      object.narrator #(terminal)
    end
  end
end

