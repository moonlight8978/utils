require_relative 'track'
require_relative 'errors/tracklists_not_match'

class Tracklist
  attr_accessor :tracklist

  def initialize(tracklist = [])
    @tracklist =
      if block_given?
        yield
      else
        tracklist
      end
  end

  def self.import(file_path, track_format = 'inl')
    File.open(file_path, 'r') do |file|
      tracklist = file.each_line.map do |line|
        Track.parse(line, track_format)
      end

      self.new(tracklist)
    end
  end

  def [](index)
    @tracklist[index]
  end

  def size
    @tracklist.length
  end

  def export(file_path)
    content = ''
    @tracklist.each do |track|
      line = "#{track.id} #{track.name} #{track.length}\r\n"
      content.concat(line)
    end
    File.open(file_path, 'w') { |file| file << content }
  end

  def translate(lang_list)
    raise TracklistsNotMatch if size != lang_list.size
    Tracklist.new do
      @tracklist.map.with_index do |track, index|
        track.translate(lang_list[index])
      end
    end
  end
end
