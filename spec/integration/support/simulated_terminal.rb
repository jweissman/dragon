require 'logger'
class SimulatedTerminal
  attr_reader :agent

  def initialize(agent)
    @agent = agent
    @log = Logger.new('log/simulation.log')
  end

  def choose_action(player: nil, actions: nil)
    @log.info [:actions, actions.map(&:label)]
    chosen_action = agent.pick_action(actions)
    player.action = chosen_action
  end

  def say(message, *)
    @log.info [:message, message]
  end
end

