class Line
  SKIPABLE_MARK = '-'

  def initialize(line, line_format)
    @line = line.strip.gsub(/\s+/, ' ')
    @format = line_format
  end

  def present?
    line != SKIPABLE_MARK
  end

  def to_track_info
    splitted = line.split(' ')
    info =
      case @format
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

private

  attr_reader :line
end
