module Dragon
  module Creatures
    class Kobold < Hominid
      def self.size_class
        VerySmall
      end

      def self.mind_class
        Simple
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
