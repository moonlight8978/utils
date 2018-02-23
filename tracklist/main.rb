require_relative 'src/track_list'
require_relative 'src/track'
require 'yaml'

# Config
config = YAML.load_file('config.yml')

IN_TRACKLIST_PATH = config['input']['tracklist_path']
LANG_PATH = config['input']['lang_path']
LANG_FORMAT = config['input']['lang_format']

OUT_TRACKLIST_PATH = config['output']['tracklist_path']

# Main process
tracklist_original = TrackList.import(IN_TRACKLIST_PATH)
tracklist_lang = TrackList.import(LANG_PATH, LANG_FORMAT)
tracklist_translated = tracklist_original.translate(tracklist_lang)
tracklist_translated.export(OUT_TRACKLIST_PATH)
