require 'ruby2ruby'
require 'ruby_parser'
require 'filipinomemes/ruby_parser_patches'

module Filipinomemes
  class Compiler
    def initialize; end

    STARTING_CODE = "# encoding: utf-8\nrequire \"filipinomemes/core_ext\"\n".freeze

    def zephyrum(code)
      ruby2ruby = Ruby2Ruby.new
      parser = RubyParser.new
      sexp = parser.process("# encoding: utf-8\n#{code}")

      ruby_code = ruby2ruby.process(sexp)

      "#{STARTING_CODE}#{ruby_code}"
    end
  end
end
