class VirtualConsole
  attr_reader :content
  attr_reader :session

  def initialize(session)
    @session = session
  end


  def clear
    flush!
  end

  def hr(*args)
  end

  def say(message, heading: false, important: false)
    opts = if important
             { options: {class: 'important'}}
           else
             {}
           end

    output_html_content.push(
      html_tag(heading ? :h4 : :p, message, opts)
    )
  end

  def ask(attr, prompt: nil, of: nil)
    puts "---> ASK #{attr}"
    
    prompt_content = html_tag(:b, prompt || "What is your #{attr}?")
    input_content  = html_tag(:input, options: {type: 'text', name: attr, placeholder: attr})


    question = "<br>" + columns(prompt_content, input_content)
    output_html_content.push(question)
  end

  def choose(attr, of: nil, choices: [], prompt: nil, labels: nil)
    puts "---> CHOOSE #{attr}"

    options_tags = choices.map do |choice|
      html_tag :option, labels ? labels[choice] : choice
    end

    options = '<br>' + columns(
      html_tag(:b, prompt || attr),
      html_tag(:select, options_tags.join, options: {name: attr})
    )

    output_html_content.push(options)
  end

  private
  def columns(a, b)
    grid_contents = html_tag(:div, a, options: { class: 'col-2-3' }) +
                    html_tag(:div, b,  options: { class: 'col-1-3' })

    html_tag(:div,
    grid_contents,
    options: { class: 'grid' })
  end

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

