require 'singleton'

class Logger
  include Singleton

  def info(message)
    puts message
  end

  def info_config(config)
    puts "Your config"
    puts "--in     (Input tracklist - original language): #{config['input']['tracklist_path']}"
    puts "--lang   (Language tracklist):                  #{config['input']['lang_path']}"
    puts "--format (Language tracklist format):           #{config['input']['lang_format']}"
    puts "--out    (Output tracklist - translated):       #{config['output']['tracklist_path']}"
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
