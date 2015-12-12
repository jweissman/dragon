module Dragon
  class SceneNarrator < Narrator
    alias_method :scene, :model

    def narrate(last_command, last_events)
      describe prefix: "You are ", heading: true

      if last_command || last_events.any?
        last_command.narrator(terminal).narrate if last_command
        describe_events(last_events, scene) if last_events.any?
      else
        say scene.default_narration
      end
    end

    def describe_events events, scene
      news = events.flatten.compact
      news.each do |event|
        delay = scene.permit_delays? && news.length > 1
        describe_event(event, delay: delay) if event.describe?
      end
    end

    def describe_event(event, delay: false)
      simulate_delay_for_dramatic_purposes if delay
      event.narrator(terminal).narrate
    end

    def simulate_delay_for_dramatic_purposes
      sleep(0.7) unless under_test?
    end
  end
end
