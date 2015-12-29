module Dragon
  module Creatures
    class Wolf < Canid
      def self.mind_class
        Dimwitted
      end

      def self.spirit_class
        HighSpirited
      end

      def self.size_class
        Medium
      end
    end
  end
end
