module Dragon
  class PlayerCharacter < Person
    attr_accessor :action, :inventory

    def self.build(console)
      PlayerBuilder.construct(self, console)
    end

    def inventory
      @inventory ||= []
    end

    def activity
      @activity ||= :exploring
    end

    def self.professions
      %w[ warrior wizard soldier rogue cleric ]
    end
  end
end
