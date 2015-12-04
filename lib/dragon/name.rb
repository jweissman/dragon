module Dragon
  class Name
    def self.generate
      @generated ||= []
      generated_name = nil

      while generated_name.nil? || @generated.include?(generated_name)
        generated_name = perform_generation
      end

      @generated.push(generated_name)
      generated_name
    end

    protected
    def self.perform_generation
      count = (1..3).to_a.sample
      components.sample(count).join.capitalize
    end

    def self.components
      %w[
        ad edsel quox saff ged tef ben chi smyt cor lin sep tim
        ag lem sen klu ef med fer wyrk ben snel set gon cad lery
        astyr aeon erath emp ko fu li sho nu ga tor mann fel
        cad iz rak nor cer lai tan ech nas grin borough tine leaf
        leg ment jed de fer lis camp hel est wry al gon smar
        mu alef bet vet gim el dal ed hay alpha beta gamma
        phi gar ef len tyg lan af nel ekru stam seg mar ald werj
        sed var veris lemm warke kru sel dric cap stel sep mer
        ka
      ]
    end
  end
end
