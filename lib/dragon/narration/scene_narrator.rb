module Dragon
  class SceneNarrator < Narrator
    alias_method :scene, :model

    def narrate(terminal, last_command, last_events)
      describe prefix: "You are ", heading: true, terminal: terminal

      if last_command || last_events.any?
        last_command.narrator.narrate(terminal) if last_command
        describe_events(terminal, last_events, scene) if last_events.any?
      else
        terminal.say scene.default_narration
      end
    end

    def describe_events terminal, events, scene
      news = events.flatten.compact
      news.each do |event|
        delay = scene.permit_delays? && news.length > 1
        describe_event(terminal, event, delay: delay) if event.describe?
      end
    end

    def describe_event(terminal, event, delay: false)
      simulate_delay_for_dramatic_purposes if delay
      event.narrator.narrate(terminal)
    end

    def simulate_delay_for_dramatic_purposes
      sleep(0.7) unless under_test?
    end
  end
end
