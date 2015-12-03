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
      count = (1..2).to_a.sample
      components.sample(count).join.capitalize
    end

    def self.components
      %w[ 

        ad edsel quox saff ged tef ben chi smyt cor lin sep tim
        sed var veris lemm warke kru sel dric cap stel sep mer
        leg ment jed de fer lis camp hel est wry al gon smar 
        phi gar ef len tyg lan af nel ekru stam seg mar ald werj 
        ag lem sen klu ef med fer wyrk ben snel set gon cad lery
        cad iz rak nor cer lai tan ech nas grin borough tine leaf
        astyr aeon erath emp ko fu li sho nu ga tor mann fel 
        mu alef bet vet gim el dal ed hay alpha beta gamma

      ]
    end
  end
end
