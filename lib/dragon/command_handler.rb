module Dragon
  class CommandHandler < Struct.new(:engine)
    extend Forwardable
    def_delegators :engine, 
      :place, :initial_scene, :world, :player, 
      :transition_to, :travel_to, :move_to, :halt!,
      :conversation_with, :combat_with

    include Dragon::Events

    def handle(command)
      raise "override CommandHandler#handle(command) in subclass"
    end
  end
end
