# Bato

Ang 'Bato Programming Language' ay isang scripting language sa wikang Filipino.

Subukan ang [Bato](https://trybato.herokuapp.com/)

## Pagtatalaga

Kailangan mo munang i-install ang Ruby programming language (version 1.9.3 o mas bago)
at pagkatapos maitalaga ang Ruby, i-run naman ito

    gem install bato

## Bakit Bato?

Ang 'bato' ay hango sa [Ruby Programming Language](http://www.ruby-lang.org/) na may Filipino sintaks.
Ang kadahilanang ginamit ang pangalang 'bato' ay dahil ang Ruby ay isang uri ng bato.

## Ang unang program

Gumawa ng isang file na `kamusta_mundo.bt` na may mga sumusunod na nilalaman

    ip 1 > 0
      mag_print "Kumusta mundo!"
    ginagawa_mue
      mag_print "Mayroong sira"
    finish_na

at pa-andarin ang program sa pamamagitan ng

    bato kamusta_mundo.bt

## Sintaks

### Pagsusulat

    "Ito ay mga serye ng mga sulat sa wikang Filipino"
    <<-FINISH_NA
      mga salita
      na nahahati
      sa ilang mga hilera
    FINISH_NA

### Dinikit na mga pamamaraan
    'magandang araw'.baliktad         # => 'wara gnadnagam'
    'Pangungusap'.haba                # => 11

### Ekspresyong Boolean

    truts
    mali
    hindi truts

### Kondisyon

Paggamit ng kondisyon.

    agik halaga > 100 dapat
      "ayos lang"
    agik_ginagawa_mue halaga > 0 dapat
      "ok lang"
    ginagawa_mue
      "wala lang"
    finish_na

    hakdog halaga
    pagka 5 dapat "lima"
    pagka 4 dapat "apat"
    ginagawa_mue "wala"
    finish_na

### Pamamaraan sa pagkakamali

    bilang_ng_pagkakamali = 0
    glhf
      # mag komento ip hindi sigurado
      1 / 0
    iligtas => pagkakamali
      bilang_ng_pagkakamali += 1
      neba_gibap ip bilang_ng_pagkakamali < 3
      iangat "malubhang pagkakamali"
    siguraduhing
      mag_print "Tapos na"
    finish_na

### Panuntunan

    ang iprintAngPangalan(pangalan = wala)
      ip pangalan != wala
        mag_print "Magandang araw sa iyo #{pangalan}!"
      ginagawa_mue
        mag_print "Magandang araw!"
      finish_na
    finish_na

    iprintAngPangalan "Maria" # => "Magandang araw sa iyo Maria!"
    iprintAngPangalan         # => "Magandang araw!"

## Paggamit ng mga ekspresyon ng mga salita sa program

### finish_na

Maari kang gumamit sa alin sa mga sumusunod sa pagtatapos ng program

    finish_na
    gg
    finish_na

Halimbawa

    bilang_ng_saging = 2
    ip bilang_ng_saging > 1
      mag_print "Mayroon akong #{bilang_ng_saging} saging! 🍌"
    ginagawa_mue
      mag_print "Wala na akong saging! 😐"
    finish_na

###  ginagawa_mue

Kung ang ekspresyon ay hindi nasunod maaring gumamit sa alin sa mga sumusunod

    ginagawa_mue
    els

Halimbawa

    pangalan_mo = "Maliksi"
    agik pangalan_mo == "Maliksi"
      mag_print "Ikaw ay si #{pangalan_mo}!"
    ginagawa_mue
      mag_print "Magandang araw sa iyo #{pangalan_mo}!"
    finish_na

### hakdog

Kung mayroon kang ekspresyon na madaming resulta gawa ng mga iba't ibang kondisyon, maari kang gumamit ng mga sumusunod

    hakdog
    kays

Halimbawa

    pangalan_mo = "Mabait"

    hakdog pangalan_mo
    ay "Maliksi"
      mag_print "Ikaw ay si Maliksi!"
    ay "Matipuno"
      mag_print "Ikaw ay si Matipuno!"
    ay "Mabait"
      mag_print "Ikaw ay si Mabait!"
    ginagawa_mue
      mag_print "Magandang araw sa iyo!"
    finish_na

### siguraduhing

Kung mayroon kang ekspresyon na gusto mong masunod kahit ano pa ang kahihinatnan nito, gumamit ng mga sumusunod

    siguraduhing
    siguraduhin

Halimbawa

    wala_na
      itaas "May sira!"
    agapan
      mag_print "Ipagpatuloy..."
      itaas "May nasira na na-agapan"
    siguraduhing
      mag_print "Tapos na"
    finish_na

### grupo

Ang grupo ay ang lalagyanan ng mga kabilang na klase sa iyong program

    grupo

Halimbawa

    grupo Hayop
      KABUUAN = 5

      bilang Aso
        ang tahol
          mag_print "Woof..."
        finish_na

        ang kumanin
          mag_print "..."
        finish_na

        ang ikembot_ang_buntot
          mag_print "Ginagawa ko ito dahil masaya ako!"
        finish_na
      finish_na
    finish_na

    dami = 6
    browny = Hayop::Aso.kumatawan
    browny.ikembot_ang_buntot ip dami >= Hayop::KABUUAN

### agik_ginagawa_mue

Gumamit ng agik_ginagawa_mue kapag mayroon ka pang kondisyon maliban sa nauna ng kondisyon

    agik_ginagawa_mue
    elsip
Halimbawa

    pangalan_mo = "Masipag"
    agik pangalan_mo == "Matipuno"
      mag_print "Ikaw ay si Matipuno!"
    agik_ginagawa_mue pangalan_mo == "Masipag"
      mag_print "Ikaw ay si Masipag!"
    ginagawa_mue
      mag_print "Wala kang rekord saamin!"
    finish_na

### ang

Ang ang ay may kalakip na pangalan upang ito ay matawag sa program

    ang
    panuntunan
    panuntunang

Halimbawa

    ang id(estudyante = {})
      pangalan = estudyante[:pangalan]
      edad     = estudyante[:edad]
      tirahan  = estudyante[:tirahan]
      baitang  = estudyante[:baitang]
      seksiyon = estudyante[:seksiyon]

      mag_print <<-FINISH_NA
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

### agapan

Ang agapan ay ginagamit kung mayroon maaaring mangyaring pagkakamali na gusto mong maisalba o mailigtas

    iligtas
    agapan

Halimbawa

    wala_na
      1 / 0
    agapan
      mag_print "Hindi ito posible!"
    finish_na

### dapat

ip mayroon kang ekspresyon na mayroong inaasahan na resulta, gumamit ng dapat

    dapat

Halimbawa

    panulat_mo = "lapis"

    papel = hakdog panulat_mo
      ay "lapis" dapat "bond paper"
      ay "ballpen" dapat "dilaw na papel"
      ginagawa_mue "intermediate paper"
    finish_na

    mag_print "Ang papel na gagamitin mo ay #{papel}"

### magbigay_daan

ip ang ekspresyon ay mayroong inaasahang dapat na ibigay na resulta habang gumagana pa ang program, gumamit ng magbigay_daan

    magbigay_daan
    bigyang_daan

Halimbawa

    ang gumawaNgID
      mag_print "------------------------------------------"
      magbigay_daan
      mag_print "------------------------------------------"
    finish_na

    ang ID(impormasyon = {})
      gumawaNgID adbans
        mag_print <<-FINISH_NA
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

### para_sa

ip may listahan na nais mong isa isahin, gumamit ng para_sa

    para_sa
    para_ang

Halimbawa

    listahan_ng_mga_prutas = ["mansanas", "mangga", "guava", "santol", "ubas"]
    para_sa prutas na_nasa listahan_ng_mga_prutas adbans
      mag_print prutas.sa_malaking_titik
    finish_na

### neba_gibap

Ginagamit ang neba_gibap upang umikot muli ang ekspresyon kung may sirang nangyari at nais mo ulit subukan pa andarin

    neba_gibap

Halimbawa

    bilang_ng_pagkakamali = 0
    glhf
      1 / 0
    agapan => pagkakamali
      bilang_ng_pagkakamali += 1
      neba_gibap ip bilang_ng_pagkakamali < 3
      iangat "malubhang pagkakamali"
    siguraduhing
      mag_print "Tapos na"
    finish_na

### ibalik

ip mayroon kang ibabalik na resulta sa nagtawag ng ang

    ibalik
    ibalik_ang
    magbalik
    magbalik_nang
    isauli
    isauli_ang
    ibigay
    ibigay_ang
    magbigay
    magbigay_nang

Halimbawa

    ang magdagdag_ng_isa(halaga)
      idadagdag = halaga + 1
      ibalik_ang halaga
    finish_na

### agik

Ginagamit ang agik kung meron kang kondisyon sa iyong ekspresyon

    agik
    ip

Halimbawa

    agik 1 > 0
      mag_print "mas madami!"
    ginagawa_mue
      mag_print "may sira"
    finish_na

### bilang

Ang bilang ay ang pagsasabilang ng isang kaukulang klasipikasyon

    bilang

Halimbawa

    grupo Tinapay
      bilang Donut
        ang flavor
          mag_print 'Strawberry!'
        finish_na
      finish_na
    finish_na

    tinapay = Tinapay::Donut.kumatawan
    tinapay.flavor
    => 'Strawberry!'

### ako_magisip

Gumamit ng ako_magisip kung may hinihintay pa na resulta, kondisyon o pangyayari

    ako_magisip
    waylwaylwayl

Halimbawa

    may_buhay = istroo

    ako_magisip may_buhay
      mag_print 'may pag-asa!'
      auko_na
    finish_na
    => 'may pag-asa!'

### alyas

Gumamit ng alyas kung kailangan mo tawagin sa ibang pangalan ang iyong panuntunan

    alyas

Halimbawa

    bilang Hayop
      ang aso
        mag_print 'si browny ay mabait!'
      finish_na
      alyas browny aso
    finish_na

    hayop = Hayop.kumatawan
    hayop.browny
    => 'si browny ay mabait!'

### nakatukoy?

Ang nakatukoy? ay ginagamit kung kailangan malaman kung umiiral ang isang grupo o klase.

    nakatukoy?
    nakasaad?

Halimbawa

    grupo Manggagawa
      bilang Magsasaka
        ang pananim
          ['sibuyas', 'kamatis', 'sili', 'palay', 'mais'].isaisahin adbans |pananim|
            mag_print "Mag tatanim ng #{pananim} ngayong panahon"
          finish_na
        finish_na
      finish_na
    finish_na

    kung nakatukoy?(Manggagawa::Magsasaka)
      mag_print 'May nakatukoy!'
    finish_na

### tanggalin

Ginagamit ang tanggalin kung may tatanggaling panuntunan sa isang klase

    tanggalin
    magtanggal

Halimbawa

    grupo Hayop
      bilang Aso
        ang tahol
          mag_print 'baw waw!'
        finish_na
      finish_na
    finish_na

    bilang Pusa < Hayop::Aso
      tanggalin tahol
      ang meow
        mag_print 'meow wahu!'
      finish_na
    finish_na

    pusa = Pusa.kumatawan

    wala_na
      pusa.tahol
    agapan => pagkakamali
      mag_print "ang pagkakamali ay '#{pagkakamali}'"
    finish_na

### tama_na

Gumamit ng 'auko_na' kung may nais kang matapos na kondisyon gamit ang 'ako_magisip'

    tama_na
    auko_na

Halimbawa

    nakamit = mali

    ako_magisip nakamit == mali
      mag_print 'hindi pa nakakamit!'
      auko_na
    finish_na

    mag_print 'nakamit na!'

### sa

Ginagamit ang 'sa' kung nais mong matukoy ang kasulukuyang listahan

    sa
    sa_loob_ng
    nasa
    na_nasa

Halimbawa

  Tignan ang [para_sa](#para_sa)

### adbans

Ginagamit ang 'adbans' kung nais mong i konteksto ang kasulukuyang listahan

    adbans
    dududu

Halimbawa

  Tignan ang [magbigay_daan](#magbigay_daan), [nakatukoy?](#nakatukoy?)

### hanggang

Ang 'hanggang' ay magpapatuloy tumakbo hanggang maabot ang tamang kundisyon.

    hanggang
    hanggang_ang
    mapa_hanggang

Halimbawa

		numero = 0
		panghuling_numero = 5
		glhf
		  mag_print "Ang numero ay #{numero} na"
		  numero += 1
		finish_na hanggang numero < panghuling_numero

### maliban_na

    malibang
    maliban_na
    maliban_ang

Halimbawa

    mga_persona = [
      { pangalan: 'Gener', kasarian: 'lalaki' },
      { pangalan: 'Karmen', kasarian: 'babae' }
    ]

    mga_persona.isaisahin adbans |tao|
      malibang tao[:kasarian] == 'lalaki'
        mag_print "si #{tao[:pangalan]} ay babae!"
      ginagawa_mue
        mag_print "si #{tao[:pangalan]} ay lalaki!"
      finish_na
    finish_na

### o

Ang 'o' ay ginagamit upang piliin ang nagsasauli ng tama.

    o
    o_ang

Halimbawa

    istroo o mali
    => istroo

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.

## Lisensya

Instituto Ng Tekonolohiya sa Massachusetts License (makikita sa LICENSE.txt na file).
