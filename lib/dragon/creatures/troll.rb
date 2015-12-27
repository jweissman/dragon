module Dragon
  module Creatures
    class Troll < Hominid
      def self.mind_class
        Slow
      end
      
      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        VeryLarge
      end
    end
  end
end
