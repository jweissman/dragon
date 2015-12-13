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
        ad ae aei aeon af ag al ald alef alpha am an asp astyr ation
        ba be bee bei ben ber bet beta bi bic bil bird bo borough box
        ca cad cairn camp cap card care ce cer chi ci cor core
        da dal de di dric dar deg din dell
        ea ech ed edsel ef ef ekru el emp en erath est
        fa fai fei fel fer fu finch fet full fem
        ga gamma gar ge ged gei gi gim go gon grin gu
        ha hai hay he hei hel her hey hi him hoi hyn
        ia ial ian ie ien ier in io ion ist iu ius iya iz
        ja jae jai jan je jei jed jem jer jex ji jim jil joy
        ka kai ke ki klu kei ko kru ku kor kae klee
        lai lan leaf leg lem lemm len lery li lin lis luth ly lyt
        mann mar med mei ment mer mo mu my myr
        na nas ne nei nel nem ni nil nim no nor nox nu nul nuth nugh ny nym
        oa oal oar oe oem oen oi ol ola oo os ost ou our oul oy
        pa pae pai pal pe pei pel phi pi pir pit po por pou pu pun pur
        qua qui quo que quox quay
        ra rae rag rai rak re reg rei ria ro roi ros rou ru rua
        sa saf sai sae se sed seg sei sel sen sep sep set shi sho si sim sin sid sig sif smar smy snel stam stel
        tan tef tim tine tor tyg tis the tion
        ua ue ui uo uy uis ug
        var veris vet vei va vo vi voy
        wa wo war werj wry wyrk wa wei wen wam wol
        xa xe xi xo xaio
        ya ye yi yo yu yr
        za ze zed zi zo
      ]
    end
  end
end
