module Dragon
  class PlayerCharacter < Person
    attr_accessor :action, :generated

    def self.build(console)
      PlayerBuilder.construct(self, console)
    end

    def self.professions
      %w[ warrior wizard soldier rogue cleric ]
    end
  end
end
