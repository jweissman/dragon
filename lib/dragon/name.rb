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
      (components.sample(2)).join.
        gsub(/([aeiou]{3})[aeiou]+/i,'\1').
        capitalize
    end

    def self.components
      %w[
        ad ae aei aeon af ag al ald alef alpha astyr ation asp an am
        ba be bei ben bet beta bi bil bo borough bird bee box bic
        ca cad camp cap ce cer ci chi cor core care card cairn
        da dal de di dric dar deg din dell
        ea ech ed edsel ef ef ekru el emp erath est
        fa fai fei fel fer fu finch fet full fem
        ga gamma gar ge gei ged gi gim go gon grin gu
        ha he hei hoi hi hay hel
        ia io in ist iz ius ion ie ian ier
        ja jae jai jan je jed jer jil jex joy jem
        ka kai ke ki klu ko kru ku kor kae klee
        lai lan leaf leg lem lemm len lery li lin lis ly lyt
        mann mar med ment mer mu mei mo my myr
        nas nel nor nu nim nem nil nei na no nox
        oa oe oi ou oy os ost ol ola
        pa pal pe pi po pou pu phi pit
        qua qui quo que quox quay
        ra rak rag rai re rei reg ro rou ru ria ros
        sa saf se sed seg sei sel sen sep sep set si shi sho smar smy snel stam stel
        tan tef tim tine tor tyg tis the tion
        ua ue ui uo uy uis ug
        var veris vet vei va vo vi voy
        wa wo war werj wry wyrk wa wei wen wam wol
        xa xe xi xo xaio
        ya ye yi yo yu yr
        za zo zed ze zi
      ]
    end
  end
end
