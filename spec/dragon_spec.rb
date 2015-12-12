require 'spec_helper'
require 'dragon/single_player_driver'

describe "Dragon" do
  context 'should play a game which' do
    before do
      expect(Dragon.single_player).to receive(:play)
    end

    it 'bootstraps without errors' do
      expect { Dragon.single_player.boot! }.not_to raise_error
    end
  end
end

