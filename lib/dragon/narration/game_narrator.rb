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
        dramatize_player(deep: deep) if player
      end
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

