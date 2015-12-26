module Dragon
  module Creatures
    class Barbarian < Hominid
      tagged :wilderness

      def self.size_class
        Large
      end
    end
  end
end
