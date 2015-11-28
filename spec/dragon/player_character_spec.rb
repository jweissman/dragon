require 'spec_helper'
require 'dragon/player_character'

describe PlayerCharacter do
  it 'has expected attributes' do
    aggregate_failures 'player stats' do
      expect { subject.name = 'Bob' }.not_to raise_error
      expect { subject.age = 25 }.not_to raise_error
      expect { subject.gender = 'other' }.not_to raise_error
    end
  end
end
