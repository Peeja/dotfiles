require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb_history"
IRB.conf[:AUTO_INDENT] = true

IRB.conf[:PROMPT][:DYNAMIC] = {
  :PROMPT_I => "%~> ",
  :PROMPT_N => "%~> ",
  :PROMPT_S => "%~%l ",
  :PROMPT_C => "%~* ",
  :RETURN => "=> %s\n"
}.tap do |prompt_config|
  prompt_config.each do |key, prompt|
    prompt.define_singleton_method :dup do
      gsub('%~') { prompt_config.fetch(:LAMBDA, ->(_){""}).call(key) }
    end
  end
end
IRB.conf[:PROMPT_MODE] = :DYNAMIC


IRB.conf[:PROMPT][:DYNAMIC][:LAMBDA] = ->(_) { File.basename(Dir.pwd) }


# http://rakeroutes.com/blog/customize-your-irb/

# load .irbrc_rails in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end
