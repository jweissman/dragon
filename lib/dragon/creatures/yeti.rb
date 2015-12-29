module Dragon
  module Creatures
    class Yeti < Hominid
      def self.mind_class
        Dimwitted
      end

      def self.size_class
        Huge
      end

      def self.spirit_class
        HighSpirited
      end
    end
  end
end
