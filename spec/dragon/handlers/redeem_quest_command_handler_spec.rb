require 'spec_helper'

describe RedeemQuestCommandHandler do
  let(:engine) { instance_double('Engine', game: game) }
  let(:game)   { instance_double('Game', player: player) }
  let(:player) { instance_double('Player', quests: [ quest ], inventory: [], xp: 0, gold: 0, xp_for_upgrade: 100) }


  subject(:handler) do
    RedeemQuestCommandHandler.new
  end

  let(:redeem_quest) do
    instance_double RedeemQuestCommand, quest: quest
  end

  let(:quest) do
    instance_double Quest,
      item_rewards: reward_item,
      xp_reward: 10,
      bounty: 10
  end

  let(:reward_item) do
    instance_double Item
  end

  let(:events) do
    handler.handle redeem_quest
  end

  let(:quest_redeemed) do
    events.detect { |e| e.is_a? QuestRedeemedEvent }
  end

  before do
    allow(handler).to receive(:engine).and_return(engine)

    expect(player).to receive(:quests=).with([])
    expect(player).to receive(:xp=).with(player.xp + quest.xp_reward)
    expect(player).to receive(:gold=).with(player.gold + quest.bounty)

    # process event...
    expect(quest_redeemed.quest).to eql(quest)
  end

  it 'should add the reward item to player inventory' do
    expect(player.inventory).to include(reward_item)
  end
end
