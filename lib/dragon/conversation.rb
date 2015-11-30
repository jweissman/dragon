module Dragon
  class Conversation < Scene
    attr_reader :partner

    def with(partner: nil)
      @partner = partner
      self
    end 

    def describe
      "talking with #{partner.describe}"
    end

    def actions(place)
      general  = general_conversational_actions(place)
      personal = personal_actions(partner)
      basic = basic_conversational_actions

      personal.merge(general).merge(basic).merge(base_actions)
    end

    def respond_to(action, place)
      case action
      when /ask_about_(.*)/
        respond_to_ask about: $1, place: place
      when :joke
        respond_to_joke
      when :goodbye
        transition_to initial_scene

        goodbye_phrase = ["See you around.", "Goodbye.", "Later!", "Take care."].sample
        partner_says goodbye_phrase
      else
        partner_says "I'm not sure I know anything about that..."
      end
    end

    protected

    def personal_actions(partner)
      partner.conversation_topics.keys.inject({}) do |hash, topic_name|
        hash[:"ask_about_#{topic_name}"] = "Ask about #{topic_name}"
        hash
      end
    end

    def general_conversational_actions(place)
      {
        ask_about_place: "Ask about #{place.describe}"
      }
    end

    def basic_conversational_actions
      {
        joke: "Tell a joke about #{Person.professions.sample}s",
        goodbye: "Say goodbye"
      }
    end


    def respond_to_ask(about: nil, place: nil)
      if about == 'place'
        partner_says [
          "I don't know much about it...", 
          "It's been here forever",
          "My grandfather helped build this town",
          "This #{place.describe} is great!"
        ].sample
      elsif partner.conversation_topics.keys.include?(about.to_sym)
        partner_says partner.conversation_topics[about.to_sym].call(partner)
      else
        partner_says "What is #{about}?"
      end
    end

    def respond_to_joke
      [ 
        partner_says(["That's a good one!", "Hehehehehe!", 
                      "You're funny.", "Thou art hilarious!"].sample),
        partner_emotes(['laughs', 'giggles', 'guffaws', 'chuckles', 'snickers'].sample) 
      ].sample
    end

    def partner_says(message)
      "#{@partner.label} says: \"#{message}\""
    end

    def partner_emotes(expression)
      "#{@partner.label} #{expression}."
    end
  end
end
