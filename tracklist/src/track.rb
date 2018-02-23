class Track
  attr_accessor :name
  attr_reader :id, :length

  def initialize(**attributes)
    @id = attributes[:id].to_s.rjust(2, "0")
    @name = attributes[:name]
    @length = attributes[:length]
  end

  # n - name, i - id, l - length
  def self.parse(line, line_format)
    splitted = line.split(' ')
    unless splitted.empty?
      id, *name_parts, length = get_trackinfo(splitted, line_format)
      self.new(id: id, name: name_parts.join(' '), length: length)
    else
      self.new(id: nil, name: nil, length: nil)
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

private

  def self.get_trackinfo(splitted, line_format)
    info =
      case line_format
      when 'n'
        [nil, splitted, nil]
      when 'in'
        [splitted, nil]
      when 'nl'
        [nil, splitted]
      when 'inl'
        splitted
      end
    info.flatten
  end
end
