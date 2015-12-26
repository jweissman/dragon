module Dragon
  module Creatures
    class Scorpion < Arachnid
      def self.size_class
        Small
      end
      
      def default_weapon
        Stinger.new
      end
    end
  end
end
