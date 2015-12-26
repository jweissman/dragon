class SimulationDriver < Dragon::Driver
  MAX_ACTIONS = 20_000

  def boot!(profession, battles)
    agent.select_profession(profession)
    step while battle_count < battles && action_count < MAX_ACTIONS
  end

  def step
    increment_action_count
    # puts
    describe
    engine.prompt_player
    engine.react engine.player.action

    engine.last_events.each do |event|
      handle(event)
    end
  end

  def handle(event)
    if event.is_a?(EnemyDiedEvent)
      print '.'
      @victories ||= 0
      @victories += 1
    elsif event.is_a?(PlayerPassedOutEvent)
      print '!'
      @losses ||= 0
      @losses += 1
    end
  end

  def victories
    @victories ||= 0
  end

  def losses
    @losses ||= 0
  end

  def victory_ratio
    victories / battle_count.to_f
  end

  def battle_count
    victories + losses
  end

  def action_count
    @action_count ||= 0
  end

  def increment_action_count
    @action_count += 1
  end

  def terminal
    @terminal ||= SimulatedTerminal.new(agent)
  end

  def agent
    @agent ||= Agent.new
  end
end

