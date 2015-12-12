module Dragon
  module Narration
    module Exposition
      def describe(object, prefix: '', suffix: '', important: false, heading: false)
        description = prefix + object.describe + suffix #(prefix: prefix, suffix: suffix)
        say description, important: important, heading: heading
      end

      protected
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
        when (3..4) then
          'are a few people'
        when (5..6) then
          'are a bunch of people'
        else
          'is a crowd of people'
        end
      end
    end
  end
end

