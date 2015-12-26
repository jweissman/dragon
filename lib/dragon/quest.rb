module Dragon
  class Quest < Saga
    # include Items

    attr_reader :requestor

    def initialize(requestor: nil)
      @requestor = requestor
      @completed = false
    end

    def completed?
      @completed
    end

    def bounty
      @bounty ||= 100 # gp
    end

    def xp_reward
      @xp_reward ||= 500 # xp
    end

    def item_rewards
      @item_reward ||= Array.new(item_reward_count) do
        Equipment.generate(exclude_types: [NaturalArmor, NaturalWeapon])
      end
    end

    def item_reward_count
      (2..3).to_a.sample
    end

    def describe_rewards
      reward_list = item_rewards.map(&:describe) + [ "#{xp_reward} xp", "#{bounty} gold" ]
      reward_list.join(', ')
    end
  end
end
