require 'singleton'

class Logger
  include Singleton

  def info(message)
    puts message
  end

  def info_config(config)
    puts "Your config"
    puts "-s --src     (Input tracklist - original language): #{config['input']['tracklist_path']}"
    puts "-l --lang    (Language tracklist):                  #{config['input']['lang_path']}"
    puts "-i --lang-id (Language tracklist has id?):          #{config['input']['lang_id']}"
    puts "-o --out     (Output tracklist - translated):       #{config['output']['tracklist_path']}"
  end

  def info_time
    puts "Finished in #{total_time}(s)"
  end

  def start
    @start = Time.now
  end

  def stop
    @finish = Time.now
  end

  def total_time
    (@finish - @start).round(4)
  end
end
