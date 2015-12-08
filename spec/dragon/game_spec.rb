require 'spec_helper'
require 'dragon'

describe Dragon::Game do
  let(:fake_term) do
    instance_double('GameTerminal', 
                    say: true, 
                    banner: true, 
                    welcome: true, 
                    narrate: true) 
  end

  let(:fake_player) do
    instance_spy('Player')
  end

  let(:fake_engine) { instance_spy('Engine', still_playing?: false) }

  before do
    allow(subject).to receive(:terminal) { fake_term }
    allow(subject).to receive(:player)   { fake_player }
    allow(subject).to receive(:engine)   { fake_engine }
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
    context 'iterates gameplay until player exits' do
      it 'should call engine#step while still_playing? is true' do
        allow(fake_engine).to receive(:still_playing?).and_return(true, false)
        expect(fake_engine).to receive(:step).exactly(:once)
        subject.play
      end
    end
  end
end
