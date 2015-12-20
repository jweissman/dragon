require 'spec_helper'

describe Building do
  let(:world) { instance_double("World") }

  Building.types.each do |type|
    describe "#{type.name.split('::').last} should have rooms" do
      subject(:building) { type.new }

      it 'should have tags' do
        expect(building.class.tags).not_to eql(Building.tags)
      end

      it 'should have a non-empty set of rooms' do
        expect(building.rooms).not_to be_empty
        expect(building.rooms).to all(be_a(Room))
      end
    end
  end
end
