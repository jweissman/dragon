require 'spec_helper'
require 'dragon/world'

describe World do
  subject { World.new name: 'fake', type: 'place', subtype: 'imaginary', wonder: 'lies' }
  describe "#describe" do
    it 'should indicate the name of the world' do
      expect(subject.describe).to include(subject.name.capitalize)
    end
  end
end

