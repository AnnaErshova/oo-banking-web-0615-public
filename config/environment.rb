Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}

require 'fileutils'
require 'open-uri' # why in the world does it require that?