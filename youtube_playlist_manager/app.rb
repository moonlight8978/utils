require 'bundler'

require 'net/http'
require 'uri'
require 'json'
require 'pp'
require 'forwardable'
require 'singleton'
require 'securerandom'

Bundler.require
Dotenv.load

require_relative 'src/api'

playlist = API.new.fetch_all
File.open('log/playlist.txt', 'w') do |file|
  file << JSON.pretty_generate(playlist.to_h)
end
