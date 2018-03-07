require_relative 'line'

class Track
  attr_accessor :name
  attr_reader :id, :length

  def initialize(**attributes)
    @id = attributes[:id].to_s.rjust(2, "0")
    @name = attributes[:name].to_s
    @length = attributes[:length].to_s
  end

  # n - name, i - id, l - length
  def self.parse(line, has_id = true)
    line = Line.new(line, has_id)

    if line.present?
      id, *name_parts, length = line.to_track_info
      self.new(id: id, name: name_parts.join(' '), length: length)
    else
      self.new
    end
  end

  def translate(lang_track)
    unless lang_track.name.empty?
      new_name = lang_track.name
      Track.new(id: id, name: new_name, length: length)
    else
      Track.new(id: id, name: name, length: length)
    end
  end

  def to_s
    [id, name, length].join(' ')
  end
end
