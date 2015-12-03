class RemoteTerminal 
  attr_reader :console, :session, :content

  def initialize(session, console)
    @session = session
    @console = console
    @content = []
  end

  def clear
    @content = []
    session.send(content: "")
  end

  def push(msg)
    content.push(msg)
    puts "===> SEND #{msg}"
    puts content.join

    session.send(output)
    #sleep 0.15
  end

  def output
    JSON.dump(content: content.join)
  end
end
