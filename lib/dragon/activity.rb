module Dragon
  class Activity
    def describe
      "override Activity#describe in subclass #{self.class.name}"
    end
  end

  module Activities
    class Exploring < Activity
      def describe
        "exploring the world"
      end
    end

    class Reading < Activity
      def describe
        "reading a book"
      end
    end

    class Resting < Activity
      def describe
        "taking a rest"
      end
    end

    class Singing < Activity
      def describe
        "singing a song"
      end
    end

    class PlayingMusic < Activity
      def describe
        "playing music on the lyre"
      end
    end

    class ThrowingDice < Activity
      def describe
        "shooting dice"
      end
    end

    class Juggling < Activity
      def describe
        "juggling"
      end
    end
  end
end
