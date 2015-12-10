module Dragon
  module Commands
    class CreatePlayerCharacterCommand < Command
      attr_accessor :name, :age, :gender, :race, :subtype, :profession

      def initialize(name: nil, age: nil, gender: nil, race: nil, subtype: nil, profession: nil)
        @name       = name
        @age        = age
        @gender     = gender
        @race       = race
        @subtype    = subtype
        @profession = profession
      end

      def label
        "Play as this hero"
      end

      def describe
        "This is the tale of #{name}'s heroic deeds"
      end
    end
  end
end
