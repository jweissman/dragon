require 'spec_helper'
require 'dragon'

describe Command do
  describe '.handler' do

    let(:fake_engine) { instance_double('Engine') }
    let(:fake_handler) { instance_double('CommandHandler') }

    it 'should indicate a reasonable handler class' do
      expect(Object).to receive(:const_get).
        with("Dragon::Handlers::CommandHandler").
        and_return(fake_handler)

      expect(fake_handler).to receive(:new).with(fake_engine)

      subject.class.handler(fake_engine)
    end
  end
end
