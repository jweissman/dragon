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
           elsif heading
             output_html_content.push("</div><div class='content-item'>")
             { options: { class: 'heading' }}
           else
             {}
           end

    output_html_content.push(
      html_tag(:p, message, opts)
    )
  end

  def ask(attr, prompt: nil, of: nil)
    prompt_content = html_tag(:div,
                             html_tag(:b, prompt || "What is your #{attr}?"), 
                             options: { class: 'question' })

    input_content  = html_tag(:input, options: {type: 'text', name: attr, placeholder: attr})


    question = columns(prompt_content, input_content)
    output_html_content.push(question)
  end

  def choose(attr, of: nil, choices: [], prompt: nil, labels: nil)
    if attr == :action
      choose_action(choices: choices, prompt: prompt, labels: labels)
    else
      options_tags = choices.map do |choice|
        html_tag :option, labels ? labels[choice] : choice
      end

      options = columns(
        html_tag(:div, html_tag(:b, prompt || attr), options: { class: 'question' }),
        html_tag(:select, options_tags.join, options: {name: attr})
      )

      output_html_content.push(options)
    end
  end

  def choose_action(choices: [], prompt: nil, labels: nil)
    buttons = choices.each_with_index.map do |choice, i|
      label = labels ? labels[choice] : choice
      opts = { type: 'submit', value: "#{i+1}: #{label}", class: 'action-choice' }
      html_tag :input, nil, options: opts
    end

    output_html_content.push buttons
  end

  private
  def columns(a, b)
    grid_contents = html_tag(:div, a, options: { class: 'col-1-3' }) +
                    html_tag(:div, b,  options: { class: 'col-2-3' })

    html_tag(:div,
    grid_contents,
    options: { class: 'grid input-container' })
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
    @content ||= [ "<div class='content-item'>" ]
  end

  def flush!
    @content = [ "<div class='content-item>'" ]
  end
end

