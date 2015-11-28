module Dragon
  class PlayerCharacter < Struct.new(:name, :job, :subtype, :race, :age, :gender, :action)
    JOBS = %w[ warrior wizard soldier rogue ]
    RACES = %w[ human elf dwarf halfling ]
    SUBTYPES = %w[ wild mutant dark light sea forest sky weird quiet ]

    def self.build(console)
      PlayerBuilder.construct(self, console)
    end
  end
end
