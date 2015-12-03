class StreamingVirtualConsole < VirtualConsole
  def terminal_proxy
    @proxy ||= RemoteTerminal.new(session, self)
  end

  def output_html_content
    terminal_proxy
  end

  def clear
    terminal_proxy.clear
  end
end
