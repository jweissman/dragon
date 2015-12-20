module Dragon
  class Aspect < Entity
    def self.elements(*elements)
      @elements = elements
    end
  end

  module Aspects
    class Illumination < Aspect; end
    class PoorlyLit < Illumination; tagged :dark end
    class WellLit < Illumination; tagged :light end

    class Size < Aspect; end
    class Tiny < Size; end
    class Small < Size; end
    class Large < Size; end
    class Huge < Size; end

    class Cleanliness < Aspect; end
    class Dirty < Cleanliness; end
    class Dusty < Cleanliness; end
    class Spotless < Cleanliness; tagged :holy end

    class Style < Aspect; end

    class Rustic < Style; end
    class Modern < Style; end

    class Color < Aspect; end

    class White < Color; tagged :holy, :life end
    class Black < Color; tagged :evil, :death end
    class Red < Color;   tagged :fire end
    class Blue < Color;  tagged :sky, :water end
    class Green < Color; tagged :nature, :trees end
    class Brown < Color; tagged :nature, :earth end
    class Golden < Color; tagged :wealth end

    class Temperature < Aspect; end

    class Hot < Temperature; end
    class Warm < Temperature; end
    class Cool < Temperature; end
    class Cold < Temperature; end

    class Prosperity < Aspect; end

    class Poor < Prosperity; end
    class Frugal < Prosperity; end
    class Rich < Prosperity; end
    class Opulent < Prosperity; end


    class AspectGroup
      def self.for(entity)
        # Object.const_get("Dragon::Aspects::" + entity.class.name.split("::").last + "Aspects") rescue NullAspectGroup
        if entity.is_a?(City)
          CityAspects
        elsif entity.is_a?(Building)
          BuildingAspects
        elsif entity.is_a?(Area)
          AreaAspects
        elsif entity.is_a?(Room)
          RoomAspects
        elsif entity.is_a?(Item)
          ItemAspects
        end
      end

      def self.list
        []
      end

      def self.generate
        list.
          map(&:types).
          map(&:sample).
          map(&:new)
      end
    end

    class CityAspects < AspectGroup
      def self.list
        [ Style, Prosperity, Cleanliness ]
      end
    end

    class BuildingAspects < AspectGroup
      def self.list
        [ Style, Color ]
      end
    end

    class AreaAspects < AspectGroup
      def self.list
        [ Size ]
      end
    end

    class RoomAspects < AspectGroup
      def self.list
        [ Temperature, Size, Cleanliness ]
      end
    end

    class ItemAspects < AspectGroup
      def self.list
        [ Cleanliness, Color ]
      end
    end
  end
end
