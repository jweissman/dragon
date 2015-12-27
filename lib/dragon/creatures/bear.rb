module Dragon
  module Creatures
    class Bear < Mammal
      tagged :aboreal, :woods, :trees

      def self.mind_class
        Slow
      end

      def self.size_class
        Large
      end
    end
  end
end
