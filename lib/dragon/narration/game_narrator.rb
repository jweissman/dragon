module Dragon
  class GameNarrator < Narrator
    extend Forwardable

    def_delegators :model, :scene, :player, :world, :city
    def_delegator :model, :current_place, :place

    def narrate(last_command, last_events, deep: false)
      scene.narrator(terminal).
        narrate(last_command, last_events)

      unless scene.squelch_narration?
        dramatize_surroundings(deep: deep)
      end

      dramatize_player if player
    end

    def dramatize_surroundings(deep: false)
      if deep && world
        dramatize_world
      end

      unless scene.squelch_narration?
        describe city,  prefix: "You are visiting "
        dramatize_place(place)
      end
    end

    def dramatize_world(deep: false)
      describe world, prefix: "You are in the world of "
    end

    def dramatize_player(display_gold: scene.show_gold?, 
                         display_quests: scene.show_quests?, 
                         display_items: scene.show_items?)
      
      if display_items && player.inventory.any?
        inventory_description = player.inventory.map(&:describe).join(', ')
        say "You have #{player.gold} gold pieces, and your inventory includes: #{inventory_description}"
      elsif display_gold && player.gold > 0
        say "You have #{player.gold} gold pieces."
      end

      if display_quests && player.quests.any?
        quest_description = player.quests.map(&:describe).join(', ')
        say "Your quests include #{quest_description}"
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
  end
end

