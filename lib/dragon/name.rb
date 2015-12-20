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
        gsub(/([aeiou]{3})[aeiou]+/i,'\1'). # truncate runs of 3+ vowels
        capitalize
    end

    def self.components
      %w[
        ad ae aei aeon af ag ai aim ain air aith al ald alef alpha am an asp astyr ation aug aul aum ay ayl ayr
        ba bai bau be bee bei beir ben ber bet beta bi bic bil bird bli bo bop bor box bug bul
        ca cad cad cai cairn caius cal camp can cap card care ce cei celi cem cen cer chi ci cli cor core
        da dal dap dar de deg dell dem den di dig dil din dric
        ea ech ed edsel ef ef ekru el emp en erath est
        fa fai fei fel fem fer fet finch fu full
        ga gamma gar ge ged gei gi gim go gon grin gu
        ha hai hay he hei hel her hey hi him hoi hyn
        ia ial ian ie ien ier in io ion ist iu ius iya iz
        ja jae jai jan je jed jei jem jer jex ji jil jim joy
        ka kae kai ke ked kei kem key ki kla klee klo klu ko kor kru ku kus
        lai lan leaf leg lem lemm len lery li lin lis luth ly lyt
        mann mar med mei ment mer mo mu my myr
        na nas ne nei nel nem ni nil nim no nor nox nu nugh nul nuth ny nym
        oa oal oar oe oem oen oi ol ola oo os ost ou ough oul our oy 
        pa pae pai pal pe pei pel phi pi pir pit po por pou pu pun pur
        qua quay que qui quo quox quin
        ra rae rag rai rak re reg rei ria ro roi ros rou ru rua
        sa sae saf sai se sed seg sei sel sen sep sep set shi sho si sid sif sig sim sin smar smy snel stam stel
        tan tef the tim tine tion tis tor tyg
        ua ue ug ui uis uo uy
        va var vei veris vet vi vo voy
        wa wa wam war wei wen werj wo wol wry wyrk
        xa xaio xe xi xo
        ya yag yai yao yav ye yei yep yi yo yoi yon yot you yr yu
        za ze zed zi zo zei zai zer zor zul zal zem zin zen zhen zhi zho zhe
      ]
    end
  end
end
