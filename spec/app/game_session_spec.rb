require 'spec_helper'
require_all 'app'

describe GameSession do
  let(:client) { instance_spy('Faye::WebSocket', send: true) }

  subject do
    GameSession.new client: client
  end
end
