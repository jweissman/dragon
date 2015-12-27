module Dragon
  module Professions
    #
    #
    #  Adventurer Classes
    #  ==================
    #
    #    primary        secondary
    #    -------        ---------
    #
    #    power          resilience     warrior
    #    power          focus          soldier
    #    intellect      focus          wizard
    #    intellect      calm           cleric
    #    focus          intellect      monk
    #    focus          resilience     paladin
    #    coordination   power          rogue
    #
    #
    class Adventurer < Profession
      tagged :wandering, :quests

      def default_weapon
        @default_weapon ||= Sword.new
      end

      def self.primary(attr)
        range_for(attr, 2..3)
      end

      def self.secondary(attr)
        range_for(attr, 1..2)
      end

      def self.weak(attr)
        range_for(attr, -2..-1)
      end

      def self.range_for(attr, range)
        define_method("#{attr}_range") { range }
      end
    end
  end
end
