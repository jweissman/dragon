module Dragon
  module Creatures
    class Ogre < Hominid
      def self.mind_class
        Simple
      end

      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        Large
      end
    end
  end
end
