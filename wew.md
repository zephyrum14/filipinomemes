### Pamamaraan sa pagkakamali

    bilang_ng_pagkakamali = 0
    glhf
      # mag komento kung hindi sigurado
      1 / 0
    reskyu => pagkakamali
      bilang_ng_pagkakamali += 1
      neba_gibap ip bilang_ng_pagkakamali < 3
      rays "malubhang pagkakamali"
    may_raket
      panomonasabe "den na"
    finish_na

### ge_talon

    ge_talon panomonasabeAngPangalan(pangalan = wala)
      ip pangalan != wala
        panomonasabe "Magandang araw sa iyo #{pangalan}!"
      ginagawa_mue
        panomonasabe "Magandang araw!"
      finish_na
    finish_na

    panomonasabeAngPangalan "Maria" # => "Magandang araw sa iyo Maria!"
    panomonasabeAngPangalan         # => "Magandang araw!"

## Paggamit ng mga ekspresyon ng mga salita sa program

### finish_na

Maari kang gumamit sa alin sa mga sumusunod sa pagtatapos ng program

    finish_na
    gg

Halimbawa

    bilang_ng_saging = 2
    ip bilang_ng_saging > 1
      panomonasabe "Mayroon akong #{bilang_ng_saging} saging! 🍌"
    ginagawa_mue
      panomonasabe "Wala na akong saging! 😐"
    finish_na

###  ginagawa_mue

Kung ang ekspresyon ay hindi nasunod maaring gumamit sa alin sa mga sumusunod

    ginagawa_mue
    els

Halimbawa

    pangalan_mo = "Maliksi"
    agik pangalan_mo == "Maliksi"
      panomonasabe "Ikaw ay si #{pangalan_mo}!"
    ginagawa_mue
      panomonasabe "Magandang araw sa iyo #{pangalan_mo}!"
    finish_na

### hakdog

Kung mayroon kang ekspresyon na madaming resulta gawa ng mga iba't ibang kondisyon, maari kang gumamit ng mga sumusunod

    hakdog
    kays

Halimbawa

    pangalan_mo = "Mabait"

    hakdog pangalan_mo
    ay "Maliksi"
      panomonasabe "Ikaw ay si Maliksi!"
    ay "Matipuno"
      panomonasabe "Ikaw ay si Matipuno!"
    ay "Mabait"
      panomonasabe "Ikaw ay si Mabait!"
    ginagawa_mue
      panomonasabe "Magandang araw sa iyo!"
    finish_na

### may_raket

Kung mayroon kang ekspresyon na gusto mong masunod kahit ano pa ang kahihinatnan nito, gumamit ng mga sumusunod

    may_raket
    ensyur

Halimbawa

    wala_na
      rays "May sira!"
    reskyu
      panomonasabe "Ipagpatuloy..."
      rays "May nasira na na-reskyu"
    may_raket
      panomonasabe "den na"
    finish_na

### mojul

Ang mojul ay ang lalagyanan ng mga kabilang na klase sa iyong program

    mojul

Halimbawa

    mojul Hayop
      KABUUAN = 5

      grupo Aso
        ang tahol
          panomonasabe "Woof..."
        finish_na

        ang kumanin
          panomonasabe "..."
        finish_na

        ang ikembot_ang_buntot
          panomonasabe "Ginagawa ko ito dahil masaya ako!"
        finish_na
      finish_na
    finish_na

    dami = 6
    browny = Hayop::Aso.bago
    browny.ikembot_ang_buntot ip dami >= Hayop::KABUUAN

### agik_ginagawa_mue

Gumamit ng agik_ginagawa_mue kapag mayroon ka pang kondisyon maliban sa nauna ng kondisyon

    agik_ginagawa_mue
    elsip
Halimbawa

    pangalan_mo = "Masipag"
    agik pangalan_mo == "Matipuno"
      panomonasabe "Ikaw ay si Matipuno!"
    agik_ginagawa_mue pangalan_mo == "Masipag"
      panomonasabe "Ikaw ay si Masipag!"
    ginagawa_mue
      panomonasabe "Wala kang rekord saamin!"
    finish_na

### ge_talon

Ang ge_talon ay may kalakip na pangalan upang ito ay matawag sa program

    ge_talon
    dep


Halimbawa

    dep id(estudyante = {})
      pangalan = estudyante[:pangalan]
      edad     = estudyante[:edad]
      tirahan  = estudyante[:tirahan]
      baitang  = estudyante[:baitang]
      seksiyon = estudyante[:seksiyon]

      panomonasabe <<-FINISH_NA
        Pangalan: #{pangalan}
        Edad:     #{edad}
        Tirahan:  #{tirahan}
        Baitang:  #{baitang}
        Seksiyon: #{seksiyon}
      FINISH_NA
    finish_na

    id({
      pangalan: "Maliksi Batubalani",
      edad: "13",
      tirahan: "Ilocos",
      baitang: "6",
      seksiyon: "Masisipag"
    })

### reskyu

Ang reskyu ay ginagamit kung mayroon maaaring mangyaring pagkakamali na gusto mong maisalba o mailigtas

    reskyu
    reskyu

Halimbawa

    wala_na
      1 / 0
    reskyu
      panomonasabe "Hindi ito posible!"
    finish_na

### den

Kung mayroon kang ekspresyon na mayroong inaasahan na resulta, gumamit ng den

    den

Halimbawa

    panulat_mo = "lapis"

    papel = hakdog panulat_mo
      ay "lapis" den "bond paper"
      ay "ballpen" den "dilaw na papel"
      ginagawa_mue "intermediate paper"
    finish_na

    panomonasabe "Ang papel na gagamitin mo ay #{papel}"

### dewei

Kung ang ekspresyon ay mayroong inaasahang dapat na retern na resulta habang gumagana pa ang program, gumamit ng dewei

    dewei
    yild

Halimbawa

    dep gumawaNgID
      panomonasabe "------------------------------------------"
      dewei
      panomonasabe "------------------------------------------"
    finish_na

    ang ID(impormasyon = {})
      gumawaNgID adbans
        panomonasabe <<-FINISH_NA
          Pangalan: #{impormasyon[:pangalan]}
          Edad:     #{impormasyon[:edad]}
          Tirahan:  #{impormasyon[:tirahan]}
          Baitang:  #{impormasyon[:baitang]}
          Seksiyon: #{impormasyon[:seksiyon]}
        FINISH_NA
      finish_na
    finish_na

    ID({
      pangalan: "Maliksi Batubalani",
      edad: "13",
      tirahan: "Ilocos",
      baitang: "6",
      seksiyon: "Masisipag"
    })

### poreber

Kung may listahan na nais mong isa isahin, gumamit ng poreber

    poreber
    por

Halimbawa

    listahan_ng_mga_prutas = ["mansanas", "mangga", "guava", "santol", "ubas"]
    poreber prutas insayd listahan_ng_mga_prutas adbans
      panomonasabe prutas.kapitalays
    finish_na

### neba_gibap

Ginagamit ang neba_gibap upang umikot muli ang ekspresyon kung may sirang nangyari at nais mo ulit subukan pa andarin

    neba_gibap

Halimbawa

    bilang_ng_pagkakamali = 0
    glhf
      1 / 0
    reskyu => pagkakamali
      bilang_ng_pagkakamali += 1
      neba_gibap ip bilang_ng_pagkakamali < 3
      rays "malubhang pagkakamali"
    may_raket
      panomonasabe "den na"
    finish_na

### magbalik

ip mayroon kang ibabalik na resulta sa nagtawag ng ang

    magbalik
    retern

Halimbawa

    dep magdagdag_ng_isa(halaga)
      idadagdag = halaga + 1
      magbalik halaga
    finish_na

### agik

Ginagamit ang agik kung meron kang kondisyon sa iyong ekspresyon

    agik
    ip

Halimbawa

    agik 1 > 0
      panomonasabe "mas madami!"
    ginagawa_mue
      panomonasabe "may sira"
    finish_na

### grupo

Ang grupo ay ang pagsasabilang ng isang kaukulang klasipikasyon

    grupo

Halimbawa

    mojul Tinapay
      grupo Donut
        dep flavor
          panomonasabe 'Strawberry!'
        finish_na
      finish_na
    finish_na

    tinapay = Tinapay::Donut.bago
    tinapay.flavor
    => 'Strawberry!'

### ako_magisip

Gumamit ng ako_magisip kung may hinihintay pa na resulta, kondisyon o pangyayari

    ako_magisip
    waylwaylwayl

Halimbawa

    may_buhay = israel

    ako_magisip may_buhay
      panomonasabe 'may pag-asa!'
      auko_na
    finish_na
    => 'may pag-asa!'

### alyas

Gumamit ng alyas kung kailangan mo tawagin sa ibang pangalan ang iyong ge_talon

    alyas

Halimbawa

    grupo Hayop
      dep aso
        panomonasabe 'si browny ay mabait!'
      finish_na
      alyas browny aso
    finish_na

    hayop = Hayop.bago
    hayop.browny
    => 'si browny ay mabait!'

### abugbug

Ang abugbug ay ginagamit kung kailangan malaman kung umiiral ang isang mojul o klase.

    abugbug
    depaynd

Halimbawa

    mojul Manggagawa
      grupo Magsasaka
        dep pananim
          ['sibuyas', 'kamatis', 'sili', 'palay', 'mais'].its adbans |pananim|
            panomonasabe "Mag tatanim ng #{pananim} ngayong panahon"
          finish_na
        finish_na
      finish_na
    finish_na

    kung abugbug(Manggagawa::Magsasaka)
      panomonasabe 'May nakatukoy!'
    finish_na

### una_ulo

Ginagamit ang una_ulo kung may tatanggaling ge_talon sa isang klase

    una_ulo
    andep

Halimbawa

    mojul Hayop
      grupo Aso
        dep tahol
          panomonasabe 'baw waw!'
        finish_na
      finish_na
    finish_na

    grupo Pusa < Hayop::Aso
      una_ulo tahol
      dep meow
        panomonasabe 'meow wahu!'
      finish_na
    finish_na

    pusa = Pusa.bago

    wala_na
      pusa.tahol
    reskyu => pagkakamali
      panomonasabe "ang pagkakamali ay '#{pagkakamali}'"
    finish_na

### tama_na

Gumamit ng 'auko_na' kung may nais kang matapos na kondisyon gamit ang 'ako_magisip'

    tama_na
    auko_na

Halimbawa

    nakamit = isrong

    ako_magisip nakamit == isrong
      panomonasabe 'hindi pa nakakamit!'
      auko_na
    finish_na

    panomonasabe 'nakamit na!'

### insayd

Ginagamit ang 'insayd' kung nais mong matukoy ang kasulukuyang listahan

    insayd

Halimbawa

  Tignan dep [poreber](#poreber)

### adbans

Ginagamit ang 'adbans' kung nais mong i konteksto ang kasulukuyang listahan

    adbans
    dududu

Halimbawa

  Tignan ang [dewei](#dewei), [abugbug](#abugbug)

### hanggang_sa_dulo

Ang 'hanggang_sa_dulo' ay magpapatuloy tumakbo hanggang_sa_dulo maabot ang tamang kundisyon.

    hanggang_sa_dulo
    antil

Halimbawa

    numero = 0
    panghuling_numero = 5
    glhf
      panomonasabe "Ang numero ay #{numero} na"
      numero += 1
    finish_na hanggang_sa_dulo numero < panghuling_numero

### payless

    payless
    anles

Halimbawa

    mga_persona = [
      { pangalan: 'Gener', kasarian: 'lalaki' },
      { pangalan: 'Karmen', kasarian: 'babae' }
    ]

    mga_persona.its adbans |tao|
      payless tao[:kasarian] == 'lalaki'
        panomonasabe "si #{tao[:pangalan]} ay babae!"
      ginagawa_mue
        panomonasabe "si #{tao[:pangalan]} ay lalaki!"
      finish_na
    finish_na

### o

Ang 'o' ay ginagamit upang piliin ang nagsasauli ng tama.

    o

Halimbawa

    israel o isrong
    => israel

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.