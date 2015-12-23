module Dragon
  class Race < Entity
    def base_bonus
      0
    end

    def power_bonus;        base_bonus end
    def intellect_bonus;    base_bonus end
    def coordination_bonus; base_bonus end
    def resilience_bonus;   base_bonus end
    def focus_bonus;        base_bonus end
    def calm_bonus;         base_bonus end
  end

  class Human    < Race
    def base_bonus
      1
    end

    def focus_bonus
      2
    end
  end

  class Dwarf    < Race
    def resilience_bonus
      4
    end

    def power_bonus
      2
    end

    def calm_bonus
      -1
    end
  end

  class Elf      < Race
    def calm_bonus
      4
    end

    def intellect_bonus
      2
    end

    def power_bonus
      -1
    end
  end

  # class Gnome    < Race; end
  # class Orc      < Race; end
  # class Goblin   < Race; end
  # class Centaur  < Race; end
  # class Treefolk < Race; end
end
