require 'spec_helper'
require 'dragon'

describe Dragon do
  context 'should play a game which' do
    let(:fake_console) do
      instance_double 'Console', 
        say: true, 
        ask: true, 
        choose: true,
        clear: true,
        hr: true
    end

    before do
      expect(Dragon.game).to receive(:console).at_least(:once).and_return(fake_console)
      expect(Dragon.game).to receive(:still_playing?).and_return(false)
    end

    it 'bootstraps without errors' do
      expect { Dragon.play! }.not_to raise_error
    end
  end
end

