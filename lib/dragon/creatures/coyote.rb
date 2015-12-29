module Dragon
  module Creatures
    class Coyote < Canid
      def self.size_class
        Large
      end

      def self.mind_class
        Simple
      end

      def self.spirit_class
        GoodSpirited
      end
    end
  end
end
