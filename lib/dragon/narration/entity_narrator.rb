module Dragon
  module Narration
    class EntityNarrator
      attr_reader :entity

      def initialize(entity)
        @entity = entity
      end

      def narrate
        describe prefix: "It is a", suffix: "(build a custom decorator for this)"
      end

      def describe(prefix: '', suffix: '')
        assemble_description(entity, prefix: prefix, suffix: suffix)
      end

      protected
      def assemble_description(prefix: '', suffix: '')
        description = add_period_if_missing(prefix + entity.describe + suffix)
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
end
