require 'spec_helper'

describe Castle do
  let(:professions) { subject.associated_professions }

  it 'should have associated professions' do
    aggregate_failures 'structure of associated professions' do
      expect(professions).to be_a(Array)
      expect(professions).not_to be_empty
      expect(professions).to all(be_a(Class))
    end
  end
end
