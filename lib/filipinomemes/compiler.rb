require 'ruby2ruby'
require 'ruby_parser'
require 'filipinomemes/ruby_parser_patches'

module Filipinomemes
  class Compiler
    def initialize; end

    PASIMULANG_KODIGO = "# encoding: utf-8\nrequire \"filipinomemes/core_ext\"\n".freeze

    def sa_ruby(kodigo)
      ruby2ruby = Ruby2Ruby.new
      parser = RubyParser.new
      sexp = parser.process("# encoding: utf-8\n#{kodigo}")

      ruby_kodigo = ruby2ruby.process(sexp)

      "#{PASIMULANG_KODIGO}#{ruby_kodigo}"
    end
  end
end
