module Dragon
  class Console
    def clear
      30.times { puts }
    end

    def hr(light: false)
      if light
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" 
      else
        puts "==============================================================="
      end
    end

    def say(msg, heading: false, newline: true, important: false)
      message = "#{!important ? '   ' : '(*) '}#{msg}"
      operation = newline ? :puts : :print

      puts if important
      if heading
        send operation, "  ----->#{message}"
      else
        send operation, "        #{message}"
      end
      puts if important

      self
    end

    def ask(attribute, of: nil, prompt: "Enter #{attribute}: ")
      puts
      say prompt, heading: true, newline: false
      of.send :"#{attribute}=", gets.chomp
    end

    def choose(attribute, of: nil, prompt: "Select #{attribute}: ", choices: nil, labels: {})
      labels = choices.inject({}, &method(:accumulate_label)) if labels.empty?

      valid_choice, choice_index = false, nil

      until valid_choice
        puts
        valid_choice, choice_index = prompt_for_choice(prompt, choices, labels)
      end

      selection = choices[choice_index-1]
      of.send :"#{attribute}=", selection
    end

    protected
    def prompt_for_choice(prompt, choices, labels)
      say prompt, heading: true
      
      choices.each_with_index do |choice, index| 
        say "(#{index+1}) #{labels[choice]}"
      end

      say "Your choice: ", newline: false

      # hard i/o block
      choice_index = gets.chomp.to_i

      valid_choice = choice_index > 0 && choice_index <= choices.count
      [valid_choice, choice_index]
    end

    private
    def accumulate_label(hash, sym)
      label = sym.
        to_s.
        gsub('_', ' ').
        split(' ').
        map(&:capitalize).
        join(' ')

      hash[sym] = label
      hash
    end
  end
end

