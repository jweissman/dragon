module Dragon
  module Creatures
    class Primate < Mammal
      tagged :trees, :forest
      def self.max_hp
        38
      end
    end
  end
end
