require 'yaml'
require 'optparse'

require_relative 'tracklist'
require_relative 'track'
require_relative 'config'
require_relative 'logger'

class App
  def create_getter(name)
    self.class.send :define_method, name do
      instance_variable_get(:"@#{name}")
    end

    self.class.send :private, name
  end

  def use(value, as:)
    instance_variable_set(:"@#{as}", value)
    create_getter as
  end

  def with(config_file_path)
    @config = Config.import(config_file_path)
      .merge(Config.from_command_line)
    Logger.instance.info_config(@config)
  end

  def translate
    Logger.instance.info "Translating..."

    in_tracklist_path = config['input']['tracklist_path']
    in_tracklist_format = config['input']['tracklist_format']
    lang_path = config['input']['lang_path']
    lang_format = config['input']['lang_format']
    out_tracklist_path = config['output']['tracklist_path']

    tracklist_original = Tracklist.import(in_tracklist_path, in_tracklist_format)
    tracklist_lang = Tracklist.import(lang_path, lang_format)
    tracklist_translated = tracklist_original.translate(tracklist_lang)
    tracklist_translated.export(out_tracklist_path)
  end

private

  attr_accessor :config
end
