module Dragon
  class SpiritClass
    def spirit_range
      (10..10)
    end

    def calm_range
      spirit_range
    end

    def coordination_range
      spirit_range
    end
  end

  class VeryLowSpirited < SpiritClass
    def spirit_range
      (8..8)
    end
  end

  class LowSpirited < SpiritClass
    def spirit_range
      (9..9)
    end
  end

  class GoodSpirited < SpiritClass; end

  class HighSpirited < SpiritClass
    def spirit_range
      (11..12)
    end
  end

  class VeryHighSpirited < SpiritClass
    def spirit_range
      (12..13)
    end
  end

  class ExtremelySpirited < SpiritClass
    def spirit_range
      (13..14)
    end
  end
end
