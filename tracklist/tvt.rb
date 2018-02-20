# Path to track list file, make sure the file is UTF-8
TRACK_LIST_PATH = 'list_in.txt'

# Path to lang file, make sure the file is UTF-8
LANG_PATH = 'lang_in.txt'

# Put your lang file format here
#   i - id
#   n - name
#   l - length
# Support formats: n, in, nl, inl
#
# Examples:
#   "01 Track name" => in
FORMAT = 'in'

# Your output file path
TRANSLATED_TRACK_LIST_PATH = 'list_out.txt'

#
#
#
#
#
# Main process
list_in = get_list(TRACK_LIST_PATH, 'itl')
lang_in = get_list(LANG_PATH, FORMAT)
translated_list = translate(list_in, lang_in)
export_list(TRANSLATED_TRACK_LIST_PATH, translated_list)

# Source codes
def get_list(file_path, mode = 't')
  list = []
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      track = parse_track(line, mode)
      list.push(track)
    end
  end

  list
end

def parse_track(line, mode, lineno = '0')
  id = lineno
  splitted = line.split(' ')
  case mode
  when 'n'
    name_parts = splitted
  when 'in'
    id, *name_parts = splitted
  when 'nl'
    *name_parts, length = splitted
  when 'inl'
    id, *name_parts, length = splitted
  end

  { id: id.rjust(2, '0'), name: name_parts.join(' '), length: length }
end

def translate(list_in, lang)
  translated_list = []
  list_in.each_with_index do |track, index|
    translated_track = track.dup
    translated_track[:name] = lang[index][:name]
    translated_list.push(translated_track)
  end

  translated_list
end

def export_list(file_path, track_list)
  content = ''
  track_list.each do |track|
    line = "#{track[:id]} #{track[:name]} #{track[:length]}\r\n"
    content.concat(line)
  end
  File.open(file_path, 'w') { |file| file << content }
end
