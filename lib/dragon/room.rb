module Dragon
  class Room < Place
    attr_accessor :building, :people, :aspect

    def describe
      "#{aspect} #{label}"
    end

    def self.generate_list(building, n)
      professions = associated_professions(building.name) #.sample(n)
      #people = Person.generate_list(professions)

      list = professions.zip(names(building.name).shuffle).collect do |profession, name| 
        generate(building, professions, name) 
      end

      list.take(n)
    end

    def self.generate(building, professions, name = names(building.name).sample)
      room  = new(name)
      room.building = building
      room.aspect   = aspects.sample
      room.people   = Array.new(2) { Person.generate(profession: professions.sample) } 
      room
    end

    def self.associated_professions(building)
      {
        house: %w[ wife child husband grandmother ],
        library: %w[ student scribe professor reader ],
        tavern: %w[ barkeep drunk waiter gambler bard ],
        church: %w[ priest penitent acolyte ],
      }[building.to_sym]
    end

    def self.names(building)
      {
        house:   %w[ living_room bedroom study kitchen sun_room hall ],
        library: %w[ study reading_room archive annex ],
        tavern:  %w[ hall study basement ],
        church:  %w[ nave sanctuary steeple refectory ],
      }[building.to_sym]
    end

    def self.aspects
      %w[ dingy clean well-kept ]
    end
  end
end
