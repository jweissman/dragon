module Dragon
  module Creatures
    class Fox < Canid
      tagged :clever, :deception, :afterlife

      def self.mind_class
        VerySmart
      end

      def self.size_class
        Small
      end
    end
  end
end
