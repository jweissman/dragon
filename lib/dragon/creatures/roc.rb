module Dragon
  module Creatures
    class Roc < Avian
      tagged :time, :magic, :dreams

      def self.spirit_class
        ExtremelySpirited
      end

      def self.mind_class
        VerySmart
      end

      def self.size_class
        Huge
      end
    end
  end
end
