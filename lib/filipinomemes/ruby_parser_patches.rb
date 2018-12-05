class RubyLexer
  def parse_number
    self.lex_state = :expr_end

    if src.scan(/[+-]?0[xXbBdD]\b/)
      rb_compile_error 'Invalid numeric format'
    # elsif src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\.\d)\b|0[Dd][0-9_]+)/)
    elsif src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\,\d)\b|0[Dd][0-9_]+)/)
      int_with_base(10)
    elsif src.scan(/[+-]?0x[a-f0-9_]+/i)
      int_with_base(16)
    elsif src.scan(/[+-]?0[Bb][01_]+/)
      int_with_base(2)
    elsif src.scan(/[+-]?0[Oo]?[0-7_]*[89]/)
      rb_compile_error 'Illegal octal digit.'
    elsif src.scan(/[+-]?0[Oo]?[0-7_]+|0[Oo]/)
      int_with_base(8)
    elsif src.scan(/[+-]?[\d_]+_(e|\.)/)
      rb_compile_error "Trailing '_' in number."
    # elsif src.scan(/[+-]?[\d_]+\.[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i)
    elsif src.scan(/[+-]?[\d_]+\,[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i)
      number = src.matched.sub(',', '.')
      rb_compile_error 'Invalid numeric format' if number =~ /__/
      self.yacc_value = number.to_f
      :tFLOAT
    elsif src.scan(/[+-]?[0-9_]+(?![e])/)
      int_with_base(10)
    else
      rb_compile_error 'Bad number format'
    end
  end
end

module RubyParserStuff
  class Keyword
    wordlist = [
      ['glhf',                 %i[kBEGIN kBEGIN], :expr_beg],
      ['wala_na',              %i[kBEGIN kBEGIN], :expr_beg],
      ['finish_na',            %i[kEND kEND], :expr_end],
      ['gg',                   %i[kEND kEND], :expr_end],
      ['els',                  %i[kELSE kELSE], :expr_beg],
      ['ginagawa_mue',         %i[kELSE kELSE], :expr_beg],
      ['kays',                 %i[kCASE kCASE], :expr_beg],
      ['hakdog',               %i[kCASE kCASE], :expr_beg],
      ['may_raket',            %i[kENSURE kENSURE], :expr_beg],
      ['ensyur',               %i[kENSURE kENSURE], :expr_beg],
      ['modyul',               %i[kMODULE kMODULE], :expr_beg],
      ['mojul',                %i[kMODULE kMODULE], :expr_beg],
      ['elsip',                %i[kELSIF kELSIF], :expr_beg],
      ['agik_ginagawa_mue',    %i[kELSIF kELSIF], :expr_beg],
      ['dep',                  %i[kDEF kDEF], :expr_fname],
      ['ge_talon',             %i[kDEF kDEF], :expr_fname],
      ['reskyu',               %i[kRESCUE kRESCUE_MOD], :expr_mid],
      ['hindi',                %i[kNOT kNOT], :expr_beg],
      ['den',                  %i[kTHEN kTHEN], :expr_beg],
      ['yild',                 %i[kYIELD kYIELD], :expr_arg],
      ['dewei',                %i[kYIELD kYIELD], :expr_arg],
      ['poreber',              %i[kFOR kFOR], :expr_beg],
      ['por',                  %i[kFOR kFOR], :expr_beg],
      ['selp',                 %i[kSELF kSELF], :expr_end],
      ['magisa',               %i[kSELF kSELF], :expr_end],
      ['isrong',               %i[kFALSE kFALSE], :expr_end],
      ['neba_gibap',           %i[kRETRY kRETRY], :expr_end],
      ['magbalik',             %i[kRETURN kRETURN], :expr_mid],
      ['retern',               %i[kRETURN kRETURN], :expr_mid],
      ['truts',                %i[kTRUE kTRUE], :expr_end],
      ['israel',               %i[kTRUE kTRUE], :expr_end],
      ['ip',                   %i[kIF kIF_MOD], :expr_beg],
      ['agik',                 %i[kIF kIF_MOD], :expr_beg],
      ['abugbug',              %i[kDEFINED kDEFINED], :expr_arg],
      ['depaynd',              %i[kDEFINED kDEFINED], :expr_arg],
      ['super',                %i[kSUPER kSUPER], :expr_arg],
      ['una_ulo',              %i[kUNDEF kUNDEF], :expr_fname],
      ['andep',                %i[kUNDEF kUNDEF], :expr_fname],
      ['tama_na',              %i[kBREAK kBREAK], :expr_mid],
      ['auko_na',              %i[kBREAK kBREAK], :expr_mid],
      ['insayd',               %i[kIN kIN], :expr_beg],
      ['adbans',               %i[kDO kDO], :expr_beg],
      ['dududu',               %i[kDO kDO], :expr_beg],
      ['wala',                 %i[kNIL kNIL], :expr_end],
      ['hanggang_sa_dulo',     %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['antil',                %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['anles',                %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['payless',              %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['o',                    %i[kOR kOR], :expr_beg],
      ['neks',                 %i[kNEXT kNEXT], :expr_mid],
      ['wen',                  %i[kWHEN kWHEN], :expr_beg],
      ['sapa',                 %i[kREDO kREDO], :expr_end],
      ['at',                   %i[kAND kAND], :expr_beg],
      ['__LINE__',             %i[k__LINE__ k__LINE__], :expr_end],
      ['bilang',               %i[kCLASS kCLASS], :expr_class],
      ['klase',                %i[kCLASS kCLASS], :expr_class],
      ['__FILE__',             %i[k__FILE__ k__FILE__], :expr_end],
      ['END',                  %i[klEND klEND], :expr_end],
      ['BEGIN',                %i[klBEGIN klBEGIN], :expr_end],
      ['waylwaylwayl',         %i[kWHILE kWHILE_MOD], :expr_beg],
      ['ako_magisip',          %i[kWHILE kWHILE_MOD], :expr_beg],
      ['alyas',                %i[kALIAS kALIAS], :expr_fname],
      ['__ENCODING__',         %i[k__ENCODING__ k__ENCODING__], :expr_end]
    ].map { |args| KWtable.new(*args) }

    # :startdoc:

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    WORDLIST18 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete '__ENCODING__'

    %w[at
       kays hakdog
       elsip agik_ginagawa_mue
       poreber por
       ip agik
       insayd
       modyul mojul
       o
       anles payless
       hanggang_sa_dulo antil
       wen
       waylwaylwayl ako_magisip].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_value
    end
    %w[hindi].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_arg
    end
  end
end
