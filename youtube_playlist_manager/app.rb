require 'bundler'
require 'net/http'
require 'uri'
require 'json'
require 'pp'

Bundler.require
Dotenv.load

class Playlist
  def initialize
    @api_key = ENV['YOUTUBE_API_KEY']
    @playlist_id = ENV['PLAYLIST_ID']
    @uri = URI('https://www.googleapis.com/youtube/v3/playlistItems')
  end

  def fetch(page_token = nil)
    params = {
      key: api_key,
      part: 'id',
      playlistId: playlist_id,
      maxResults: 50,
    }
    params.merge!({ pageToken: page_token }) if page_token
    p params
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
  end

  def fetch_all
    res = fetch
    body = JSON.parse(res.body, symbolize_names: true)
    data = body
    puts res.code
    puts body[:nextPageToken]
    while body[:nextPageToken]
      res = fetch(body[:nextPageToken])
      body = JSON.parse(res.body, symbolize_names: true)
      puts res.code
      puts body[:nextPageToken]
      data[:items].concat(body[:items])
    end

    content = File.open('out.txt', 'w') do |file|
      file << JSON.pretty_generate(data)
    end
  end

private

  attr_reader :api_key, :playlist_id, :uri
end

class Result
  def read
    content = File.open('out.txt', 'r') do |file|
      JSON.parse(file.read, symbolize_names: true)
    end
  end
end

# Playlist.new.fetch_all
playlist = Result.new.read
puts playlist[:items].size
