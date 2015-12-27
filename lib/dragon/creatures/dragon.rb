module Dragon
  module Creatures
    class Dragon < Reptile
      def self.mind_class
        Genius
      end

      def self.spirit_class
        ExtremelySpirited
      end

      def self.size_class
        Gigantic
      end
    end
  end
end
