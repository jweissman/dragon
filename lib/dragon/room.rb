module Dragon
  class Room < Place
    attr_accessor :building, :people, :aspect

    def describe
      "#{aspect} #{name.gsub('_', ' ')}"
    end

    def self.generate_list(building, n)
      professions = building.associated_professions.sample(n)
      names = names(building.type.downcase).shuffle

      list = professions.
        zip(names).
        take(n).
        collect do |profession, name|
        generate(building, professions, name)
      end

      list
    end

    def self.generate(building, professions, name = names(building.type).sample)
      room  = new(name)
      room.building = building
      room.aspect   = aspects.sample
      room.people   = Array.new(2) do
        profession = building.associated_professions.sample
        Person.generate(profession: profession)
      end
      room
    end

    # def self.associated_professions(building)
    #   {
    #     house: ,
    #     library: ,
    #     tavern: ,
    #     church: ,
    #     hospital: %w[ nurse priest student doctor ]
    #   }[building.to_sym]
    # end

    def self.names(building)
      {
        house:   %w[ living_room bedroom study kitchen sun_room hall ],
        library: %w[ study reading_room archive annex ],
        tavern:  %w[ hall study basement ],
        church:  %w[ nave sanctuary steeple refectory ],
        hospital: %w[ ward surgery nursery ],
        castle: %w[ soldier king queen nobleman noblewoman ]
      }[building.to_sym]
    end

    def self.aspects
      %w[ dusty dingy clean well-kept beautiful cold warm dirty ]
    end
  end
end
