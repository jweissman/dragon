require 'spec_helper'
require 'dragon/single_player_driver'

describe SinglePlayerDriver do
  let(:term) do
    instance_double('GameTerminal',
                    say: true,
                    banner: true,
                    welcome: true,
                    narrate: true)
  end

  let(:player) do
    instance_spy('Player')
  end

  let(:engine) { instance_spy('Engine', still_playing?: false) }

  let(:narrator) { instance_double("Narrator", narrate: nil) }
  let(:scene) { instance_double("Scene", deep_narration?: false, narrator: narrator, squelch_narration?: true) }
  let(:world) { instance_double("World") }
  let(:game) { instance_double("Game", scene: scene) }

  subject(:single_player_driver) { SinglePlayerDriver.new(world) }

  before do
    allow(single_player_driver).to receive(:terminal) { term }
    allow(single_player_driver).to receive(:player)   { player }
    allow(single_player_driver).to receive(:engine)   { engine }
    allow(single_player_driver).to receive(:game)     { game }
  end

  describe '#boot!' do
    after { single_player_driver.boot! }

    it 'should display banner' do
      expect(term).to receive(:banner)
      allow(game).to receive(:still_playing?).and_return(false)
    end
  end

  describe '#play' do
    after { single_player_driver.play }
    context 'iterates gameplay until player exits' do
      it 'should call engine#step while still_playing? is true' do
        allow(game).to receive(:still_playing?).and_return(true, false)
        expect(single_player_driver).to receive(:step).exactly(:once)
        single_player_driver.play
      end
    end
  end
end
