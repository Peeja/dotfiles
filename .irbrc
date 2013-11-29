require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1000

if ENV['RAILS_ENV']
  def log_to_console!
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    nil
  end
end
