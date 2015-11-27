require 'dragon/version'

module Dragon
  class Town; end
  class World; end
  class Player; end

  def self.welcome
    "Welcome to Dragon v#{VERSION}!"
  end

  class Game
    def play!
      puts Dragon.welcome
    end
  end
end
