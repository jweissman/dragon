module Dragon
  class Subtype < Entity
    def self.class_for(object)
      if object.is_a?(Race)
        RacialSubtype
      elsif object.is_a?(Creature)
        CreatureSubtype
      elsif object.is_a?(City)
        CitySubtype
      else
        raise "no subtypes for #{object.class.name}"
      end
    end

    def self.generate_for(object)
      class_for(object).types.sample.new
    end
  end

  ##
  class CitySubtype < Subtype
    # all cities have these..
    tagged :family #, :law #, :medicine, :education, :crime # :music, :eating, :family, :education, :crime
  end

  class Cultural < CitySubtype
    tagged :culture, :music, :entertainment, :alcohol, :books, :cooking
  end

  class Industrial < CitySubtype
    tagged :industry, :commerce, :work, :urban, :production, :goods
  end

  class Port < CitySubtype
    tagged :commerce, :trade, :urban, :shipping, :crime, :ocean, :goods
  end

  class Agricultural < CitySubtype
    tagged :farming, :rural, :domestic, :agriculture, :work, :food, :poverty, :arboreal
  end

  class Holy < CitySubtype
    tagged :healing, :holy, :praying, :religious, :life, :writing, :education
  end

  class Imperial < CitySubtype
    tagged :royal, :court, :urban, :military, :government, :wealth, :industry, :commerce
  end

  ##
  class CreatureSubtype < Subtype; end

  class Glowing < CreatureSubtype; end
  class Furious < CreatureSubtype; end
  class Zombie < CreatureSubtype; tagged :evil end

  ##
  class RacialSubtype < Subtype
    def base_modifier
      0
    end

    def power_modifier;        base_modifier end
    def intellect_modifier;    base_modifier end
    def coordination_modifier; base_modifier end
    def resilience_modifier;   base_modifier end
    def focus_modifier;        base_modifier end
    def calm_modifier;         base_modifier end
  end

  class Wild < RacialSubtype
    tagged :wilderness

    def power_modifier
      2
    end
  end

  class Mutant < RacialSubtype
    tagged :toxic

    def resilience_modifier
      1
    end

    def coordination_modifier
      1
    end
  end

  class Forest < RacialSubtype
    tagged :nature, :arboreal

    def focus_modifier
      1
    end

    def calm_modifier
      1
    end
  end

  class Dark < RacialSubtype
    tagged :dark

    def intellect_modifier
      -1
    end

    def power_modifier
      2
    end
  end

  class Light < RacialSubtype
    tagged :light

    def intellect_modifier
      2
    end

    def power_modifier
      -1
    end
  end

  class High < RacialSubtype
    tagged :sky

    def base_modifier
      1
    end

    def resilience_modifier
      -1
    end
  end

  class Deep < RacialSubtype
    tagged :earth

    def resilience_modifier
      2
    end

    def power_modifier
      1
    end
  end

  class Weird < RacialSubtype
    tagged :strange

    def base_modifier
      rand > 0.5 ? -1 : 1
    end
  end

  class Quiet < RacialSubtype
    tagged :mute

    def intellect_modifier
      1
    end

    def calm_modifier
      1
    end
  end

  class Giant < RacialSubtype
    tagged :big

    def power_modifier
      4
    end

    def calm_modifier
      -2
    end
  end
end
