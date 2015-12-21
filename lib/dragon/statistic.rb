module Dragon
  class Statistic
  end

  class Power < Statistic; end
  class Resilience < Statistic; end
  class Focus < Statistic; end
  class Coordination < Statistic; end
  class Charm < Statistic; end
  class Intellect < Statistic; end

  class StatisticSet
    def self.components
      [ Power, Resilience, Focus, Coordination, Charm, Intellect ]
    end
  end
end
