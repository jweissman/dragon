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
    session.send(output)
  end

  def output
    JSON.dump(content: content.join)
  end
end
