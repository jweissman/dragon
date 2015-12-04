require 'spec_helper'
require 'dragon'

describe Event do
  describe '.listener' do
    let(:fake_listener) { instance_double('EventListener') }

    it 'should indicate a reasonable listener class' do
      expect(Object).to receive(:const_get).
        with("Dragon::Listeners::EventListener").
        and_return(fake_listener)

      expect(fake_listener).to receive(:new)

      subject.class.listener
    end
  end
end
