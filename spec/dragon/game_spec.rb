require 'spec_helper'
require 'dragon/game'

describe Dragon::Game do
  let(:fake_term) do
    instance_double('GameTerminal', say: true, banner: true, welcome: true, narrate: true) 
  end

  let(:fake_player) do
    instance_spy('Player', action: :quit)
  end

  let(:fake_town) { instance_spy('Town') }
  let(:fake_world) { instance_spy('World') }

  before do
    allow(subject).to receive(:console) { fake_term }
    allow(subject).to receive(:player)  { fake_player }

    allow(subject).to receive(:town).and_return fake_town
    allow(subject).to receive(:world).and_return fake_world
  end

  describe '#boot!' do
    after { subject.boot! }

    it 'should display banner' do
      expect(fake_term).to receive(:banner)
    end

    it 'should start gameplay' do
      expect(subject).to receive(:play)
    end
  end

  describe '#play' do
    after { subject.play }
    it 'should welcome the player' do
      expect(fake_term).to receive(:welcome).with(fake_player)
    end

    context 'iterates gameplay until player exits' do
      it 'should call #step while still_playing? is true' do
        allow(subject).to receive(:still_playing?).and_return(true, false)
        expect(subject).to receive(:step).exactly(:once)
        subject.play
      end
    end
  end

  describe '#step' do
    after { subject.step }
    it 'should narrate the scene and interact with the player' do
      expect(subject).to receive(:narrate).with(world: fake_world, town: fake_town)
      expect(subject).to receive(:interact)
    end
  end
end
