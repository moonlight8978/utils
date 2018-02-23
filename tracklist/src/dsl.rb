require_relative 'logger'

def start(app_class, &block)
  Logger.instance.info "Prepare for translating..."
  Logger.instance.start

  app = app_class.new
  app.instance_eval(&block)

  Logger.instance.stop
  Logger.instance.info_time
end
