require 'rspec'
require 'pry'
require 'dragon'

include Dragon

include Dragon::Commands
include Dragon::Handlers

include Dragon::Events

include Dragon::Scenes

include Dragon::Buildings

include Dragon::Items

include Dragon::Professions

def under_test?
  true
end
