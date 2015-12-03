module Dragon
  class CommandHandler < Struct.new(:engine)
    include Dragon::Events
  end
end
