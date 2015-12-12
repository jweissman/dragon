module Dragon
  class SceneNarrator < Narrator
    alias_method :scene, :model

    def narrate(last_command, last_events)
      describe scene, prefix: "You are ", heading: true

      unless last_command || last_events.any?
        say scene.default_narration
      end

      command = last_command
      if command
        describe command, important: true
      end

      events = last_events
      describe_events(events, scene) if events.any?
    end

    def describe_events events, scene
      if events.any?
        news = events.flatten.compact
        news.each do |event|
          if scene.permit_delays?
            simulate_delay_for_dramatic_purposes if news.length > 1
          end

          describe event, important: true if event.describe?
        end
      end
    end

    def simulate_delay_for_dramatic_purposes
      sleep(0.7) unless under_test?
    end
  end
end
