module Dragon
  module Creatures
    class Bat < Mammal
      tagged :cave, :earth, :sky

      def self.mind_class
        Slow
      end

      def self.size_class
        VerySmall
      end
    end
  end
end
