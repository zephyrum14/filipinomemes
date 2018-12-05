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
      ['siguraduhing',         %i[kENSURE kENSURE], :expr_beg],
      ['siguraduhin',          %i[kENSURE kENSURE], :expr_beg],
      ['modyul',               %i[kMODULE kMODULE], :expr_beg],
      ['grupo',                %i[kMODULE kMODULE], :expr_beg],
      ['elsip',                %i[kELSIF kELSIF], :expr_beg],
      ['agik_ginagawa_mue',    %i[kELSIF kELSIF], :expr_beg],
      ['ang',                  %i[kDEF kDEF], :expr_fname],
      ['panuntunang',          %i[kDEF kDEF], :expr_fname],
      ['panuntunan',           %i[kDEF kDEF], :expr_fname],
      ['iligtas',              %i[kRESCUE kRESCUE_MOD], :expr_mid],
      ['agapan',               %i[kRESCUE kRESCUE_MOD], :expr_mid],
      ['hindi',                %i[kNOT kNOT], :expr_beg],
      ['dapat',                %i[kTHEN kTHEN], :expr_beg],
      ['bigyang_daan',         %i[kYIELD kYIELD], :expr_arg],
      ['magbigay_daan',        %i[kYIELD kYIELD], :expr_arg],
      ['para_sa',              %i[kFOR kFOR], :expr_beg],
      ['para_ang',             %i[kFOR kFOR], :expr_beg],
      ['mayselp',              %i[kSELF kSELF], :expr_end],
      ['magisa',               %i[kSELF kSELF], :expr_end],
      ['mali',                 %i[kFALSE kFALSE], :expr_end],
      ['neba_gibap',           %i[kRETRY kRETRY], :expr_end],
      ['ibalik',               %i[kRETURN kRETURN], :expr_mid],
      ['ibalik_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['magbalik',             %i[kRETURN kRETURN], :expr_mid],
      ['magbalik_nang',        %i[kRETURN kRETURN], :expr_mid],
      ['isauli',               %i[kRETURN kRETURN], :expr_mid],
      ['isauli_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['ibigay',               %i[kRETURN kRETURN], :expr_mid],
      ['ibigay_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['magbigay',             %i[kRETURN kRETURN], :expr_mid],
      ['magbigay_nang',        %i[kRETURN kRETURN], :expr_mid],
      ['truts',                %i[kTRUE kTRUE], :expr_end],
      ['istroo',               %i[kTRUE kTRUE], :expr_end],
      ['ip',                   %i[kIF kIF_MOD], :expr_beg],
      ['agik',                 %i[kIF kIF_MOD], :expr_beg],
      ['nakatukoy?',           %i[kDEFINED kDEFINED], :expr_arg],
      ['nakasaad?',            %i[kDEFINED kDEFINED], :expr_arg],
      ['super',                %i[kSUPER kSUPER], :expr_arg],
      ['tanggalin',            %i[kUNDEF kUNDEF], :expr_fname],
      ['magtanggal',           %i[kUNDEF kUNDEF], :expr_fname],
      ['tama_na',              %i[kBREAK kBREAK], :expr_mid],
      ['auko_na',              %i[kBREAK kBREAK], :expr_mid],
      ['sa',                   %i[kIN kIN], :expr_beg],
      ['sa_loob_ng',           %i[kIN kIN], :expr_beg],
      ['nasa',                 %i[kIN kIN], :expr_beg],
      ['na_nasa',              %i[kIN kIN], :expr_beg],
      ['yudodis',              %i[kDO kDO], :expr_beg],
      ['dududu',               %i[kDO kDO], :expr_beg],
      ['wala',                 %i[kNIL kNIL], :expr_end],
      ['hanggang',             %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['hanggang_ang',         %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['mapa_hanggang',        %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['malibang',             %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['maliban_na',           %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['maliban_ang',          %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['o',                    %i[kOR kOR], :expr_beg],
      ['o_ang',                %i[kOR kOR], :expr_beg],
      ['sumunod',              %i[kNEXT kNEXT], :expr_mid],
      ['kasunod',              %i[kNEXT kNEXT], :expr_mid],
      ['pagka',                %i[kWHEN kWHEN], :expr_beg],
      ['pagka_ang',            %i[kWHEN kWHEN], :expr_beg],
      ['ay',                   %i[kWHEN kWHEN], :expr_beg],
      ['ulitin',               %i[kREDO kREDO], :expr_end],
      ['at_ulitin',            %i[kREDO kREDO], :expr_end],
      ['uliting_muli',         %i[kREDO kREDO], :expr_end],
      ['at',                   %i[kAND kAND], :expr_beg],
      ['at_ang',               %i[kAND kAND], :expr_beg],
      ['__LINE__',             %i[k__LINE__ k__LINE__], :expr_end],
      ['bilang',               %i[kCLASS kCLASS], :expr_class],
      ['klase',                %i[kCLASS kCLASS], :expr_class],
      ['__FILE__',             %i[k__FILE__ k__FILE__], :expr_end],
      ['END',                  %i[klEND klEND], :expr_end],
      ['BEGIN',                %i[klBEGIN klBEGIN], :expr_end],
      ['waylwaylwayl',               %i[kWHILE kWHILE_MOD], :expr_beg],
      ['ako_magisip',           %i[kWHILE kWHILE_MOD], :expr_beg],
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

    %w[at at_ang
       kays hakdog
       elsip agik_ginagawa_mue
       para_sa para_ang
       ip agik
       sa sa_loob_ng nasa na_nasa
       modyul grupo
       o o_ang
       malibang maliban_na maliban_ang
       hanggang hanggang_ang mapa_hanggang
       pagka pagka_ang ay
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
