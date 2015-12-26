module Dragon
  module Items
    class Weapon < Equipment
      def damage_range
        base_damage + material.strength + quality.modifier
      end
    end
  end
end
