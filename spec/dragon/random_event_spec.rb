require 'spec_helper'

describe RandomEvent do
  describe '.place_discovered' do
    let(:origin)      { instance_double("City") }
    let(:destination) { City.new }
    let(:cause)       { "something happened" }

    subject(:event) do
      RandomEvent.place_discovered(destination, origin, cause)
    end

    it 'should create an event' do
      expect(event).to be_a(PlaceDiscoveredEvent)
    end
  end
end
