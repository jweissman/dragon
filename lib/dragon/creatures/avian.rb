module Dragon
  module Creatures
    class Avian < Creature
      tagged :sky

      def default_weapon
        Talons.new
      end

      def self.spirit_class
        VeryHighSpirited
      end

      def self.mind_class
        Simple
      end

      def self.size_class
        VerySmall
      end
    end
  end
end
