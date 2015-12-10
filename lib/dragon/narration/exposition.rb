module Dragon
  module Narration
    module Exposition
      def describe(entity, prefix: '', suffix: '', important: false, heading: false)
        description = assemble_description(entity, prefix: prefix, suffix: suffix)
        say description, important: important, heading: heading
      end

      protected
      def assemble_description(entity, prefix: '', suffix: '')
        description = add_period_if_missing(prefix + entity.describe + suffix)
        capitalize_first_word(description)
      end

      def describe_people(people)
        people.map(&:describe).join('; ')
      end

      def describe_number_of_people(number)
        case number
        when 0 then
          'is nobody'
        when 1 then 
          'is one person'
        when 2 then 
          'are two people'
        when (3..4).to_a then 
          'are a few people'
        when (5..6).to_a then
          'are a bunch of people'
        else
          'is a crowd of people'
        end
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

