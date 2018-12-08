require 'spec_helper'

kwentomo_sapagong 'Compiler' do
  italaga_ang(:starting_code) do
    "# encoding: utf-8\nrequire \"filipinomemes/core_ext\"\n"
  end

  italaga_ang(:compiler) do
    Filipinomemes::Compiler.new
  end

  diziz 'Filipinomemes is empty' do
    compiler.zephyrum('').should == starting_code + ''
  end

  kwentomo_sapagong 'Count' do
    diziz 'whole count' do
      compiler.zephyrum('1').should == starting_code + '1'
    end

    diziz 'small count' do
      compiler.zephyrum('1.2').should == starting_code + '1.2'
    end

    diziz 'count list' do
      compiler.zephyrum('[1.2, 3]').should == starting_code + '[1.2, 3]'
    end
  end

  kwentomo_sapagong 'Boolean Expression' do
    diziz 'Usage of israel or true' do
      compiler.zephyrum('israel').should == starting_code + 'true'
    end

    diziz 'Usage of isrong or false' do
      compiler.zephyrum('isrong').should == starting_code + 'false'
    end

    diziz 'Usage of isnot or not' do
      compiler.zephyrum('isnot israel').should == starting_code + '(not true)'
    end
  end

  kwentomo_sapagong 'Keywords' do
    diziz 'Usage of agik / den / agik_ginagawa_mue / ginagawa_mue / finish_na' do
      compiler.zephyrum('
        agik 1 den
          2
        agik_ginagawa_mue 3
          4
        ginagawa_mue
          5
        finish_na').should be_like(starting_code +
        '1 ? (2) : (3 ? (4) : (5))')
    end

    diziz 'Usage of hakdog / wen / den / ginagawa_mue / finish_na' do
      compiler.zephyrum("
        hakdog 1
        wen 1 den 1
        wen 2
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

    diziz 'wala_na / reskyu / rays / may_raket / finish_na' do
      # The raise is the Kernel method rather than the keyword
      compiler.zephyrum('
        wala_na
          1 / 0
        reskyu => pagkakamali
          neba_gibap
          rays pagkakamali, pagkakamali.iulat
        may_raket
          panomonasabe "Katapusan"
        finish_na').should be_like(starting_code +
        'begin
          (1 / 0)
        rescue => pagkakamali
          retry
          rays(pagkakamali, pagkakamali.iulat)
        ensure
          panomonasabe("Katapusan")
        end')
    end
  end

  kwentomo_sapagong 'Kernel method' do
    diziz "Usage and printing using 'panomonasabe' function" do
      compiler.zephyrum("panomonasabe 'abc'").should ==
        starting_code + 'panomonasabe("abc")'
    end
  end

  kwentomo_sapagong 'String function' do
    diziz 'Usage sikstinayn or reverse function' do
      resulta = eval compiler.zephyrum("'zephyrum'.sikstinayn")
      resulta.should == 'muryhpez'
    end

    diziz 'Usage of longgadog or length function' do
      resulta = eval compiler.zephyrum("'Zephyrum'.longgadog")
      resulta.should == 8
    end
  end
end
