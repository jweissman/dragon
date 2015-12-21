module Dragon
  module Handlers
    class AskQuestionCommandHandler < CommandHandler
      include Questions

      def handle(command)
        partner = command.partner
        question = command.question

        response = question.responses.sample
        events = [ say_response(partner, response) ]

        if question.about?(Activity)
          handle_activity(partner, question)
        end

        if question.about?(Quest)
          events = quest_events(partner, question)
        end

        events
      end

      def handle_activity(partner, question)
        if question.is_a?(AskToStop)
          partner.activity = (partner.activities - [partner.activity.class]).sample.new
        elsif question.is_a?(AskToStart)
          partner.activity = question.activity
        else
          raise "Unknown activity-related quesetion: #{question.class}"
        end
      end

      def quest_events(partner, question)
        partner_quests = active_quests_for(partner)
        if partner_quests.any?
          completed_quests = partner_quests.select(&:completed?)
          if completed_quests.any?
            completed_quests.map do |quest|
              WordsSpokenEvent.new(
                person: partner,
                message: "You've completed the quest #{quest.describe}! Why don't you redeem it for #{quest.reward.describe}?"
              )
            end
          else
            partner_quests.map do |quest|
              WordsSpokenEvent.new(
                person: partner,
                message: "Didn't I already give you a quest #{quest.describe}?")
            end
          end
        else # no outstanding quests, complete or incomplete
          [
            say_response(partner, question.responses.sample),
            offer_quest(generate_quests_for(partner).sample)
          ]
        end
      end

      def active_quests_for(partner)
        player.quests.select { |q| q.requestor == partner }
      end

      def generate_quests_for(partner)
        [
          KillEnemies.new(
            count: (3..5).to_a.sample,
            species: Creature.categories.sample.new,
            requestor: partner
          )
        ]
      end

      def offer_quest(quest)
        QuestOfferedEvent.new(quest: quest)
      end

      def say_response(partner, response)
        WordsSpokenEvent.new(person: partner, message: response)
      end
    end
  end
end
