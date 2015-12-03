module Dragon
  module Handlers
    class LeaveItemCommandHandler < CommandHandler
      def handle(command)
        item = command.item

        ItemLeftBehindEvent.new item: item
        #"The #{item.describe} was left behind"
      end
    end
  end
end
