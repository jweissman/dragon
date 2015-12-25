module Dragon
  class Narrator
    extend Forwardable

    # def_delegators :terminal, :say

    attr_reader :model
    def initialize(model) #, terminal: nil)
      @model    = model
      # @terminal = terminal
    end

    def describe(prefix: '', suffix: '', important: false, heading: false, terminal: nil)
      description = assemble_description(prefix: prefix, suffix: suffix)

      if terminal
        terminal.say description, important: important, heading: heading
      end

      description
    end

    protected
    def assemble_description(prefix: '', suffix: '')
      description = add_period_if_missing(prefix + model.describe + suffix)
      capitalize_first_word(description)
    end

    private
    def capitalize_first_word(sentence)
      words = sentence.split(' ')
      first = words.first.capitalize
      rest  = words[1..-1]

      [first, rest].flatten.join(' ')
    end

    def add_period_if_missing(sentence)
      unless punctuation.include?(sentence.chars.last)
        sentence += '.'
      end

      sentence
    end

    def punctuation
      %w[ . ? ! ' " ]
    end
  end
end
