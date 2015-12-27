module Dragon
  class SizeClass
    def body_range
      (10..10)
    end

    def power_range
      body_range
    end

    def resilience_range
      body_range
    end
  end

  class Tiny < SizeClass
    def body_range
      (7..7)
    end
  end

  class VerySmall < SizeClass
    def body_range
      (8..8)
    end
  end

  class Small < SizeClass
    def body_range
      (9..9)
    end
  end

  class Medium < SizeClass
  end

  class Large < SizeClass
    def body_range
      (11..12)
    end
  end

  class VeryLarge < SizeClass
    def body_range
      (13..14)
    end
  end

  class Huge < SizeClass
    def body_range
      (14..15)
    end
  end

  class Gigantic < SizeClass
    def body_range
      (16..18)
    end
  end
end
