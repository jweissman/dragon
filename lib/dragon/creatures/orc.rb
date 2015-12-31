module Dragon
  module Creatures
    class Orc < Hominid
      def self.default_weapon_material
        Steel.new
      end

      def self.spirit_class
        ExtremelySpirited
      end
    end
  end
end
