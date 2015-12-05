require 'spec_helper'
require_all 'app'

describe GameSession do
  let(:client) { instance_spy('Faye::WebSocket', send: true) }

  subject do
    GameSession.new client: client
  end

  it 'should send down the character form' do
    expect { subject.make_character }.not_to raise_error
    expect(client).to have_received(:send).with(an_instance_of(String)).at_least(:once)
  end
end
