module Dragon
  class Race < Entity
    include CombatAttributes

    # def base_modifier
    #   0
    # end

    # def power_modifier;        base_modifier end
    # def intellect_modifier;    base_modifier end
    # def coordination_modifier; base_modifier end
    # def resilience_modifier;   base_modifier end
    # def focus_modifier;        base_modifier end
    # def calm_modifier;         base_modifier end
  end

  class Human    < Race
    def base_modifier
      1
    end

    def focus_modifier
      2
    end
  end

  class Dwarf    < Race
    def resilience_modifier
      4
    end

    def power_modifier
      2
    end

    def calm_modifier
      -1
    end
  end

  class Elf      < Race
    def calm_modifier
      4
    end

    def intellect_modifier
      2
    end

    def power_modifier
      -1
    end
  end

  # class Gnome    < Race; end
  # class Orc      < Race; end
  # class Goblin   < Race; end
  # class Centaur  < Race; end
  # class Treefolk < Race; end
end
