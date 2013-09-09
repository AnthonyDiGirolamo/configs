require 'yaml'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# interactive editor: use vim from within irb
begin
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end

require 'pp'
# awesome print
# begin
#   require 'awesome_print'
#   AwesomePrint.irb!
# rescue LoadError => err
#   warn "Couldn't load awesome_print: #{err}"
# end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

