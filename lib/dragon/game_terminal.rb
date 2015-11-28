module Dragon
  class GameTerminal < Console
    def banner
      clear
      hr
      say BANNER 
      hr
      self
    end

    def welcome(player)
      hr
      say "Thanks for playing Dragon, #{player.name} the #{player.job}!"
      self
    end

    def narrate(world: nil, town: nil)
      describe world, prefix: "You are in the world of " if world
      describe town,  prefix: "The town you are in currently is " if town
    end

    def describe(entity, prefix: '')
      say prefix + entity.describe
    end
  end
end
