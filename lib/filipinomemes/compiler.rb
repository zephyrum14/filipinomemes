require 'ruby2ruby'
require 'ruby_parser'
require 'filipinomemes/ruby_parser_patches'

#I made the compiler, lexer and parser explicitly UTF-8 (Universal Transformation Format - 8 bit).
#This will make code cleaner and allows the program to deal with extended chars in class and method name.
module Filipinomemes
  class Compiler
    def initialize; end
    STARTING_CODE = "# encoding: utf-8\nrequire \"filipinomemes/core_ext\"\n".freeze
    #the contents of the core_ext folder are utitility classes
    def zephyrum(code)
      #instantiating objects for compiler class
      ruby2ruby = Ruby2Ruby.new
      parser = RubyParser.new
      sexp = parser.process("# encoding: utf-8\n#{code}")
      ruby_code = ruby2ruby.process(sexp)

      "#{STARTING_CODE}#{ruby_code}"
    end
  end
end
