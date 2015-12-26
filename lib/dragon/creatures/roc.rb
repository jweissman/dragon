module Dragon
  module Creatures
    class Roc < Creature
      tagged :time, :magic, :dreams

      def self.size_class
        Large
      end
    end
  end
end
