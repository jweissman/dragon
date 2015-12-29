module Dragon
  module Creatures
    class Fox < Canid
      tagged :clever, :deception, :afterlife

      def self.spirit_class
        GoodSpirited
      end

      def self.mind_class
        Smart
      end

      def self.size_class
        Small
      end
    end
  end
end
