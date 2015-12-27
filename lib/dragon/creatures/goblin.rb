module Dragon
  module Creatures
    class Goblin < Hominid
      def self.default_weapon_material
        Iron.new
      end

      def self.size_class
        Small
      end

      def self.spirit_class
        VeryHighSpirited
      end
    end
  end
end
