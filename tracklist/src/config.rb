class Config
  def initialize(config = { 'input' => {}, 'output' => {} })
    @config = config
  end

  def self.import(path)
    self.new(YAML.load_file(path))
  end

  def self.from_command_line
    options = self.new
    OptionParser.new do |opt|
      opt.on('--in IN') { |o| options['input']['tracklist_path'] = o }
      opt.on('--inf IN') { |o| options['input']['tracklist_format'] = o }
      opt.on('--lang FORMAT') { |o| options['input']['lang_path'] = o }
      opt.on('--langf LANG') { |o| options['input']['lang_format'] = o }
      opt.on('--out OUT') { |o| options['output']['tracklist_path'] = o }
    end.parse!
    options
  end

  def [](key)
    @config[key]
  end

  def []=(key, val)
    @config[key] = val
  end

  def merge(other_config)
    merged = self.class.new
    config.keys.each do |key|
      merged[key] = config[key].merge(other_config[key]) do |_key, oldval, newval|
        newval.nil? ? oldval : newval
      end
    end
    merged
  end

private

  attr_reader :config
end
