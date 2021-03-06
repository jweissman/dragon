module Dragon
  module Creatures
    class Primate < Mammal
      tagged :trees, :forest

      def default_weapon
        @default_weapon ||= Fists.new
      end

      def self.size_class
        Small
      end

      def self.mind_class
        Smart
      end
    end
  end
end
