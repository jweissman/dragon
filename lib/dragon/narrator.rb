require 'dragon/narration/exposition'

module Dragon
  class Narrator
    include Narration::Exposition
    extend Forwardable

    def_delegators :terminal, :say

    attr_reader :terminal, :model
    def initialize(model, terminal: nil)
      @model    = model
      @terminal = terminal
    end
  end
end
