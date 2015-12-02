class VirtualConsole
  attr_reader :content
  attr_reader :questions, :choices

  def clear
    flush!
    @questions = []
    @choices = {}
  end

  def hr(*args)
    output_html_content.push("<br><hr><br>")
  end

  def say(message)
    # accumulate output from the engine
    output_html_content.push(
      html_tag(:p, message)
    )
  end

  def ask(attr,*args)
    # translate into html forms ...
    # just a text box maybe
    @questions ||= []
    @questions << attr

    puts "---> ASK #{attr}"
    p args
    question = html_tag(:div,
      html_tag(:b, attr) +
      html_tag(:input, options: {type: 'text', name: attr})
    )

    output_html_content.push(question)
  end

  def choose(attr, of: nil, choices: [], prompt: nil)
    # translate to html
    # just some selects
    puts "---> CHOOSE #{attr}"

    @choices ||= {}
    @choices[attr] = {prompt: prompt, choices: choices}

    options_tags = choices.map do |choice|
      html_tag :option, choice
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

