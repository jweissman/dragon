module Dragon
  module Professions
    class Monk < Adventurer
      tagged :holy, :praying, :kneeling, :religious, :clergy

      def default_max_hp
        30
      end
    end
  end
end
