module Dragon
  module Creatures
    class Bear < Mammal
      tagged :aboreal, :woods, :trees

      def self.size_class
        VeryLarge
      end
    end
  end
end
