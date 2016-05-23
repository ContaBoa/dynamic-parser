begin
  require 'dotenv'
  Dotenv.load
rescue LoadError => e
  puts "dotenv is not available"
end
require 'bundler'

Encoding.default_internal = "utf-8"
Encoding.default_external = "utf-8"

module DynamicParser
  require_relative 'dynamic_parser/regex_cache'
  require_relative 'dynamic_parser/micro_parser'
  require_relative 'dynamic_parser/parser'
  require_relative 'dynamic_parser/version'

  # alias method
  def logger
    DynamicParser.logger
  end

  # Returns the lib logger object
  def self.logger
    @logger || initialize_logger
  end

  # Initializes logger with DynamicParser setup
  def self.initialize_logger(log_target = STDOUT)
    oldlogger = @logger
    @logger = Logger.new(log_target)
    @logger.level = Logger::INFO
    @logger.progname = 'dynamic_parser'
    oldlogger.close if oldlogger && !$TESTING # don't want to close testing's STDOUT logging
    @logger
  end

end
