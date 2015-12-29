module Dragon
  module Creatures
    class Jackal < Canid
      def self.mind_class
        Dimwitted
      end

      def self.spirit_class
        GoodSpirited
      end
      
      def self.size_class
        VerySmall
      end
    end
  end
end
