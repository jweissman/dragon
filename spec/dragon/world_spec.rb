require 'spec_helper'
require 'dragon/world'

describe World do
  subject { World.new 'fake', 'place', 'imaginary', 'lies' }
  describe "#describe" do
    it 'should indicate the name of the world' do
      expect(subject.describe).to include(subject.name)
    end
  end
end

