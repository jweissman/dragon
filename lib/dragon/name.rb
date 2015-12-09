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
      count = (2..3).to_a.sample
      components.sample(count).join.capitalize
    end

    def self.components
      %w[
        ad ae aei aeon af ag al ald alef alpha astyr ation
        ba be bei ben bet beta bi bil bo borough
        ca cad camp cap ce cer ci chi cor
        da dal de di dric
        ea ech ed edsel ef ef ekru el emp erath est
        fa fai fei fel fer fu
        ga gamma gar ge gei ged gi gim go gon grin gu
        ha he hei hoi hi hay hel
        ia io in ist iz ius ion
        ja jae jai jan je jed jer jil jex
        ka kai ke ki klu ko kru ku
        lai lan leaf leg lem lemm len lery li lin lis ly lyt
        mann mar med ment mer mu
        nas nel nor nu nim nem nil
        oa oe oi ou oy os ost
        pa pal pe pi po pou pu phi
        qua qui quo que quox quay
        ra rak rag rai re rei reg ro rou ru ria ros
        sa saf se sed seg sei sel sen sep sep set si shi sho smar smy snel stam stel
        tan tef tim tine tor tyg tis the tion
        ua ue ui uo uy uis ug
        var veris vet
        wa wo war werj wry wyrk
        xa xe xi xo xaio
        ya ye yi yo yu yr
        za zo zed
      ]
    end
  end
end
