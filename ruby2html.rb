#!/usr/bin/env ruby
# Call this script from your favorite text editor
# to generate HTML from your syntax-colored code.

require 'rubygems'
require 'syntax'
require 'syntax/convertors/html'

CSS = <<-CSSSRC
<style type="text/css">
/* Syntax highlighting */
pre {font-family: mono, monospace, courier;}
pre .normal {}
pre .comment { color: #005; font-style: italic; }
pre .keyword { color: #A00; font-weight: bold; }
pre .method { color: #077; }
pre .class { color: #074; }
pre .module { color: #050; }
pre .punct { color: #447; font-weight: bold; }
pre .symbol { color: #099; }
pre .string { color: #944; background: #FFE; }
pre .char { color: #F07; }
pre .ident { color: #000; }
pre .constant { color: #07F; }
pre .regex { color: #B66; background: #FEF; }
pre .number { color: #F99; }
pre .attribute { color: #5bb; }
pre .global { color: #7FB; }
pre .expr { color: #227; }
pre .escape { color: #277; }
</style>
CSSSRC


document = ARGV.empty? ? STDIN.read : File.read(ARGV[0])
convertor = Syntax::Convertors::HTML.for_syntax "ruby"
$stdout.write(CSS+convertor.convert( document ))
