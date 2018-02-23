#!/usr/bin/env ruby

require_relative 'src/app'
require_relative 'src/dsl'

start App do
  with 'config.yml'
  translate
end
