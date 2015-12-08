module Dragon
  module Events
    class NewPlayerCharacterUnderConstructionEvent < Event
      attr_reader :player

      def describe?
        false
      end
    end
  end
end
