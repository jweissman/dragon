module Dragon
  module Items
    class Equipment < Item
      def self.materials
        [ Steel, Iron ]
      end
    end
  end
end
