module Dragon
  module Items
    class Equipment < Item
      def self.materials
        [ Steel, Bronze, Iron ]
      end
    end
  end
end
