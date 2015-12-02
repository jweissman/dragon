class VirtualConsole
  attr_reader :content

  def clear
    flush!
  end

  def hr(*args)
    output_html_content.push("<br><hr><br>")
  end

  def say(message, heading: false, important: nil)
    output_html_content.push(
      html_tag(heading ? :h4 : :p, message)
    )
  end

  def ask(attr,*args)
    puts "---> ASK #{attr}"
    p args
    question = html_tag(:div,
      html_tag(:b, "What is your #{attr}?") +
      html_tag(:input, options: {type: 'text', name: attr})
    )

    output_html_content.push(question)
  end

  def choose(attr, of: nil, choices: [], prompt: nil, labels: nil)
    puts "---> CHOOSE #{attr}"

    options_tags = choices.map do |choice|
      html_tag :option, labels ? labels[choice] : choice
    end

    options = html_tag(:div,
      html_tag(:b, prompt || attr) +
      html_tag(:select, options_tags.join, options: {name: attr})
    )

    output_html_content.push(options)
  end

  private
  def html_tag(tag, content='', options: {})
    options_string = if options.any?
                options.map do |key,val|
                  " #{key}='#{val}'"
                end.join
              else
                ''
              end
    "<#{tag}#{options_string}>#{content}</#{tag}>"
  end

  def output_html_content
    @content ||= []
  end

  def flush!
    @content = []
  end
end

