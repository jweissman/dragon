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
  end

  class Wild < RacialSubtype
    tagged :wilderness
  end

  class Mutant < RacialSubtype
    tagged :toxic
  end

  class Forest < RacialSubtype
    tagged :nature, :arboreal
  end

  class Dark < RacialSubtype
    tagged :dark
  end

  class Light < RacialSubtype
    tagged :light
  end

  class High < RacialSubtype
    tagged :sky
  end

  class Deep < RacialSubtype
    tagged :earth
  end

  class Weird < RacialSubtype
    tagged :strange
  end

  class Quiet < RacialSubtype
    tagged :mute
  end

  class Giant < RacialSubtype
    tagged :big
  end
end
