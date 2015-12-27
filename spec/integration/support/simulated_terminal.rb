class SimulatedTerminal
  attr_reader :agent

  def initialize(agent)
    @agent = agent
  end

  def choose_action(player: nil, actions: nil)
    #p [:actions, actions.map(&:label)]
    chosen_action = agent.pick_action(actions)
    player.action = chosen_action
  end

  def say(message, *)
    #p [:message, message]
  end
end

