require 'spec_helper'

describe Quest do
  subject(:quest) do
    KillEnemies.new
  end

  it 'should describe its rewards' do
    expect(subject.describe_rewards).to include("gold")
    expect(subject.describe_rewards).to include("xp")
  end
end
