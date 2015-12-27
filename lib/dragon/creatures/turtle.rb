module Dragon
  module Creatures
    class Turtle < Reptile
      tagged :moon, :time, :earth

      def self.size_class
        Small
      end
    end
  end
end
