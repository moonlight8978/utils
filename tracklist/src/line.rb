# Each line in source file (tracklist, lang)
class Line
  # Line start with this will be marked as skipable line
  SKIPABLE_MARK = '-'

  def initialize(line, has_id)
    @line = line.strip.gsub(/\s+/, ' ')
    @has_id = has_id
  end

  # Track id in line
  def has_id?
    @has_id
  end

  def present?
    line != SKIPABLE_MARK
  end

  # Track length in line
  def has_length?
    @line.match?(/\s\d+:\d+$/)
  end

  # Parse line to track info array
  #   first element: track id
  #   ...:           name parts
  #   last element:  track length
  def to_track_info
    splitted = line.split(' ')

    id_and_name =
      if has_id?
        splitted
      else
        [nil, splitted]
      end
    info_array =
      if has_length?
        id_and_name
      else
        [id_and_name, nil]
      end

    info_array.flatten
  end

private

  attr_reader :line
end
