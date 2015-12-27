module Dragon
  module Creatures
    class Kobold < Hominid
      def self.size_class
        Tiny
      end

      def self.mind_class
        Slow
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
