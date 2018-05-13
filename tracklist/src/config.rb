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
      opt.on('-s PATH', '--src PATH', 'Input tracklist path') { |o| options['input']['tracklist_path'] = o }

      opt.on('-l PATH', '--lang PATH', 'Language tracklist path') { |o| options['input']['lang_path'] = o }
      opt.on('-i[HAS_ID]', '--lang-id[HAS_ID]', 'Language tracklist contain id or not') { |o| options['input']['lang_id'] = true }

      opt.on('-o PATH', '--out PATH', 'Output path') { |o| options['output']['tracklist_path'] = o }
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
