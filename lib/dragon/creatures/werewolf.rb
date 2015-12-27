module Dragon
  module Creatures
    class Werewolf < Canid
      def self.mind_class
        VerySmart
      end

      def self.size_class
        Large
      end
    end
  end
end
