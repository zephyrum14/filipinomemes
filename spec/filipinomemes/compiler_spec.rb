require 'spec_helper'

isalaysay_ang 'Compiler' do
  italaga_ang(:starting_code) do
    "# encoding: utf-8\nrequire \"filipinomemes/core_ext\"\n"
  end

  italaga_ang(:compiler) do
    Filipinomemes::Compiler.new
  end

  ito_ang 'Filipinomemes is empty' do
    compiler.zephyrum('').should == starting_code + ''
  end

  isalaysay_ang 'bilang' do
    ito_ang 'pambuong bilang' do
      compiler.zephyrum('1').should == starting_code + '1'
    end

    ito_ang 'maliliit na bilang' do
      compiler.zephyrum('1.2').should == starting_code + '1.2'
    end

    ito_ang 'listahan ng mga bilang' do
      compiler.zephyrum('[1.2, 3]').should == starting_code + '[1.2, 3]'
    end
  end

  isalaysay_ang 'ekspresyong Boolean' do
    ito_ang 'ekspresyon ng truts o true' do
      compiler.zephyrum('truts').should == starting_code + 'true'
    end

    ito_ang 'ekspresyon ng mali o false' do
      compiler.zephyrum('mali').should == starting_code + 'false'
    end

    ito_ang 'ekspresyon ng hindi o not' do
      compiler.zephyrum('hindi truts').should == starting_code + '(not true)'
    end
  end

  isalaysay_ang 'susing mga salita' do
    ito_ang 'ekspresyon ng agik / dapat / agik_ginagawa_mue / ginagawa_mue / finish_na' do
      compiler.zephyrum('
        agik 1 dapat
          2
        agik_ginagawa_mue 3
          4
        ginagawa_mue
          5
        finish_na').should be_like(starting_code +
        '1 ? (2) : (3 ? (4) : (5))')
    end

    ito_ang 'ekspresyon ng hakdog / pagka / dapat / ginagawa_mue / finish_na' do
      compiler.zephyrum("
        hakdog 1
        pagka 1 dapat 1
        pagka 2
          2
        ginagawa_mue
          3
        finish_na").should be_like(starting_code +
        'case 1
        when 1 then
          1
        when 2 then
          2
        else
          3
        end')
    end

    ito_ang 'glhf / iligtas / iangat / siguraduhing / finish_na' do
      # raise ir Kernel metode nevis atslēgvārds
      compiler.zephyrum('
        glhf
          1 / 0
        iligtas => pagkakamali
          neba_gibap
          iangat pagkakamali, pagkakamali.iulat
        siguraduhing
          mag_print "Katapusan"
        finish_na').should be_like(starting_code +
        'begin
          (1 / 0)
        rescue => pagkakamali
          retry
          iangat(pagkakamali, pagkakamali.iulat)
        ensure
          mag_print("Katapusan")
        end')
    end
  end

  isalaysay_ang 'pamamaraan sa Kernel' do
    ito_ang "ekspresyon ng pagsusulat gamit ang 'mag_print'" do
      compiler.zephyrum("mag_print 'abc'").should ==
        starting_code + 'mag_print("abc")'
    end
  end

  isalaysay_ang 'Dinikit na mga pamamaraan' do
    ito_ang 'ekspresyon ng pamamaraan sa pagbabaliktad ng mga titik' do
      resulta = eval compiler.zephyrum("'magandang araw'.baliktad")
      resulta.should == 'wara gnadnagam'
    end

    ito_ang 'ekspresayon ng pamamaraan sa pagsukat ng haba ng salita' do
      resulta = eval compiler.zephyrum("'Pangungusap'.haba")
      resulta.should == 11
    end
  end
end
