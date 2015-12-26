class Simulation
  attr_reader :world

  def initialize(profession: Warrior, world: World.new, battles: 10)
    @world = world
    driver.boot!(profession, battles)
  end

  def pc
    driver.engine.player
  end

  def driver
    @simulation ||= SimulationDriver.new(world)
  end
end
