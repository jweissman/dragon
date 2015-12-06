module Dragon
  module Handlers
    class AskQuestionCommandHandler < CommandHandler
      def handle(command)
        partner = command.partner
        topic   = command.topic

        response = topic.responses.sample
        events = [ WordsSpokenEvent.new(person: partner, message: response) ]

        if topic.about_activity?
          partner.activity = topic.activity
        end

        if topic.about_missions?

          partner_quests = engine.player.quests.select { |q| q.requestor == partner }
          if partner_quests.any?

            completed_quests = partner_quests.select { |quest| quest.completed? }
            if completed_quests.any?
              events = completed_quests.map do |quest|
                QuestRedemptionOfferedEvent.new(quest: quest)
              end
            else
              # we need to clear out the above 'positive' message
              events = [
                WordsSpokenEvent.new(
                  person: partner,
                  message: "Don't you already have a quest from me?"
                )
              ]
            end
          else # no outstanding quests, complete or incomplete
            events << offer_quest(quests_for(partner).sample)
          end
        end

        events
      end

      def quests_for(partner)
        [
          KillEnemies.new(
            count: [2,3].sample, 
            species: Enemy.species_list.sample, 
            requestor: partner
          )
        ]
      end

      def offer_quest(quest)
        QuestOfferedEvent.new(quest: quest)
      end
    end
  end
end
