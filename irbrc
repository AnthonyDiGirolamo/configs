require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize
require 'hirb'
Hirb::View.enable
Hirb::View.resize 40, 40

def reset
	Dispatcher.reset_application!
end

