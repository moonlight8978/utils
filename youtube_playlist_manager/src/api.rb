class API
  API_KEY = ENV['YOUTUBE_API_KEY']
  PLAYLIST_ID = ENV['PLAYLIST_ID']
  END_POINT = 'https://www.googleapis.com/youtube/v3/playlistItems'

  DEFAULT_PARAMS = {
    key: API_KEY,
    playlistId: PLAYLIST_ID,
    part: 'id, snippet',
    maxResults: 50,
  }

  def initialize
    @uri = URI(END_POINT)
  end

  def fetch_all
    begin
      i = 1
      first_part = fetch(i)
      next_parts = []

      playlist = first_part
      playlist.export
      while playlist.next_page?
        i += 1
        playlist = fetch(i, playlist.next_page_token)
        playlist.export
        next_parts.push(playlist)
      end

      first_part.tap do |playlist|
        playlist.merge(*next_parts)
      end
    rescue NetError => error
      File.open('log/errors.txt', 'a') do |file|
        file << "Code #{error.code} (#{error.message})\n"
        file << error.detail
      end
    end
  end

private

  attr_reader :uri

  def fetch(id, page_token = nil, **options)
    puts "Page token: #{page_token}"
    params = DEFAULT_PARAMS.merge(options)
    params = params.merge({ pageToken: page_token }) if page_token
    uri.query = URI.encode_www_form(params)
    res = Response.new(Net::HTTP.get_response(uri))
    puts "Response HTTP code: #{res.code}"
    if res.success?
      Playlist.from_raw(id, res.body)
    else
      raise NetError.new(res.message, res.code, res.body)
    end
  end

  # Custom Error for HTTP Request
  class NetError < StandardError
    attr_accessor :code, :detail

    def initialize(msg = "Failed to send request.", code = nil, detail = nil)
      super(msg)
      @code = code
      @detail = detail
    end
  end

  # HTTP Response Wrapper
  class Response
    extend Forwardable

    attr_reader :res

    def_delegators :res, :body, :code, :message

    def initialize(res)
      @res = res
    end

    def success?
      res.is_a?(Net::HTTPSuccess)
    end

    def error?
      res.is_a?(Net::HTTPError)
    end
  end

  # Response playlist in text
  class Playlist
    attr_reader :text, :items, :total_items, :next_page_token, :raw, :id, :etag

    def initialize(id, items, total_items, etag, next_page_token, raw = nil)
      @id = id
      @text = text
      @items = items
      @total_items = total_items
      @etag = etag
      @next_page_token = next_page_token
      @raw = raw
    end

    def self.from_raw(id, text)
      playlist = JSON.parse(text, symbolize_names: true)
      self.new(
        id,
        playlist[:items],
        playlist[:pageInfo][:totalResults],
        playlist[:etag],
        playlist[:nextPageToken],
        text
      )
    end

    def merge(*playlists)
      playlists.each do |playlist|
        self.items.concat(playlist.items)
      end
    end

    def export
      File.open("log/playlists/#{filename}", 'w') do |file|
        file << raw
      end
    end

    def next_page?
      !!next_page_token
    end

    def to_h
      {
        etag: etag,
        total_items: total_items,
        items: items
      }
    end

  private

    def filename
      "pl_#{id}_#{secure_token}"
    end

    def secure_token
      "" || SecureRandom.uuid
    end
  end
end
