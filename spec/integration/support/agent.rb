class Agent
  def profession_to_select
    @profession_to_select ||= Warrior
  end

  def select_profession(profession)
    @profession_to_select = profession
  end

  def pick_action(actions)
    create_character = create_character_actions(actions)
    wander           = wander_actions(actions)
    attack           = attack_actions(actions)

    return create_character unless create_character.nil?
    return wander unless wander.nil?
    return attack unless attack.nil?

    actions.sample
  end

  def attack_actions(actions)
    actions.detect do |action|
      action.is_a?(AttackCommand)
    end
  end

  def wander_actions(actions)
    actions.detect do |action|
      action.is_a?(WanderCommand) ||
        action.is_a?(EgressCommand) ||
        action.is_a?(IgnorePersonCommand) ||
        (action.is_a?(VisitCommand) && action.place.class.can_wander?)
    end
  end

  def create_character_actions(actions)
    actions.detect do |action|
      action.is_a?(GeneratePlayerCharacterCommand) ||
        (action.is_a?(CreatePlayerCharacterCommand) && action.profession.is_a?(profession_to_select))
    end
  end
end

