module Dragon
  class SizeClass
    def body_range
      (10..10)
    end

    # everything gets a little bump in power
    # over their resilience so on average things
    # can hit each other and do damage :)
    def power_range
      body_range + 1
    end

    def resilience_range
      body_range
    end
  end

  class Tiny < SizeClass
    def body_range
      (4..5)
    end
  end

  class VerySmall < SizeClass
    def body_range
      (6..7)
    end
  end

  class Small < SizeClass
    def body_range
      (8..9)
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

  class Enormous < SizeClass
    def body_range
      (15..16)
    end
  end

  class Huge < SizeClass
    def body_range
      (17..18)
    end
  end

  class Gigantic < SizeClass
    def body_range
      (19..20)
    end
  end
end
