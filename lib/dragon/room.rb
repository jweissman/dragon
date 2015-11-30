module Dragon
  class Room < Place
    attr_accessor :building, :people, :aspect

    def describe
      "#{aspect} #{label}"
    end

    def self.generate_list(building, n)
      professions = associated_professions(building.name).sample(n)
      #people = Person.generate_list(professions)

      list = professions.zip(names(building.name).shuffle).collect do |profession, name| 
        generate(building, profession, name) 
      end

      list.take(n)
    end

    def self.generate(building, profession, name = names(building.name).sample)
      room  = new(name)
      room.building = building
      room.aspect   = aspects.sample
      room.people   = [ Person.generate(profession: profession) ] 
      #Person.generate_list(people(building.name).sample(2))
      room
    end

    def self.associated_professions(building)
      {
        house: %w[ wife child husband grandmother ],
        library: %w[ student scribe professor reader ],
        tavern: %w[ barkeep drunk waiter gambler bard ]
      }[building.to_sym]
    end

    def self.names(building)
      {
        house:   %w[ living_room bedroom study ],
        library: %w[ study reading_room stacks ],
        tavern:  %w[ mess_hall study ]
      }[building.to_sym]
    end

    def self.aspects
      %w[ dingy clean well-kept ]
    end
  end
end
