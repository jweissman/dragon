module Dragon
  module Creatures
    class Naga < Snake
      tagged :water, :dark, :cavern

      def self.mind_class
        VerySmart
      end

      def self.size_class
        Large
      end

      def self.spirit_class
        VeryHighSpirited
      end
    end
  end
end
