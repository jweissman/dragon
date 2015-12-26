module Dragon
  module Creatures
    class Snake < Reptile
      tagged :dark, :poison
      
      def self.size_class
        Small
      end
    end
  end
end
