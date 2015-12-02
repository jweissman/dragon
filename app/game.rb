require 'sinatra'
require 'dragon'

class VirtualConsole
  def clear
    output_html_content.push("<br>"*20)
  end

  def hr
    output_html_content.push("<br><hr><br>")
  end

  def say(message)
    # accumulate output from the engine
    output_html_content.push(message)
  end

  def ask(*args)
    # translate into html forms ...
    # just a text box maybe
    puts "---> ASK"
  end

  def choose(*args)
    # translate to html
    # just some selects
    puts "---> narrate #{args}"
  end

  def output_html_content
    @content ||= []
  end
end

$console = VirtualConsole.new
$game = Dragon::Engine.new(console: $console)

get '/play' do
  $game.step
  $console.content.each do |line|
    "<p>#{line}</p>"
  end
end
