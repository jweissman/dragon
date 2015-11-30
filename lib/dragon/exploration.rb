module Dragon
  class Exploration < Scene
    def describe
      "exploring"
    end

    def respond_to(action, place)
      case action
      when /visit_(.*)/
        respond_to_visit place_id: $1
      when /talk_to_(.*)/
        respond_to_converse partner_id: $1
      when :egress
        respond_to_egress place
      else
        super(action,place)
      end
    end

    def infer_destination_from(id: nil)
      target = Entity.all.detect { |p| p.id == id.to_i }

      if target.is_a?(Building)
        target = target.rooms.sample
      end

      target
    end

    def respond_to_visit(place_id: nil)
      destination = infer_destination_from id: place_id

      move_to destination

      "You walk to #{destination.describe}."
    end

    def respond_to_egress(place)
        area = place.building.town.areas.first

        move_to area

        "You walk to the #{area.describe}."
    end

    def respond_to_converse(partner_id: nil)
      partner = Entity.all.detect { |p| p.id == partner_id.to_i }

      if rand > 0.1
        transition_to conversation_with(partner: partner)

        "#{partner.describe} greets you!"
      else
        "#{partner.describe} does not seem to feel like talking now."
      end
    end

    ##

    def actions(place)
      indoor_actions(place).
        merge(outdoor_actions(place)).
        merge(people_actions(place)).
        merge(base_actions)
    end

    def people_actions(place)
      place.people.inject({}) do |hash,person|
        hash[:"talk_to_#{person.id}"] = "Converse with #{person.label} [#{person.profession}]"
        hash
      end
    end

    def indoor_actions(place)
      return {} unless place.is_a?(Room)

      other_rooms = place.building.rooms - [place]

      actions = other_rooms.inject({}) do |hash,room|
        hash[:"visit_#{room.id}"] = "Walk to #{room.describe}"
        hash
      end

      actions[:egress] = "Leave #{place.building.describe}"

      actions
    end

    def outdoor_actions(place)
      return {} unless place.is_a?(Area)

      buildings = place.town.buildings + (place.town.areas - [place])

      buildings.inject({}) do |hash,building|
        hash[:"visit_#{building.id}"] = "Visit #{building.describe}"
        hash
      end
    end
  end
end
