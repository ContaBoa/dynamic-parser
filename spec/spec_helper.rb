require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'pry'
require 'pry-nav'
require 'dynamic_parser'
require 'rspec'
require 'rspec/mocks'
require 'rspec/expectations'
require "pathname"
require 'factory_girl'

if ENV['TRAVIS']==true
  begin
    require 'coveralls'
    Coveralls.wear!
  rescue Exception => e
    puts "Coveralls not available!"
  end  
end

SPECDIR = Pathname.new(File.dirname(__FILE__))
TMPDIR = SPECDIR.join("tmp")

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|r| require r}
Dir[File.dirname(__FILE__) + "/factories/**/*.rb"].each {|r| require r}

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = :random
  config.include FactoryGirl::Syntax::Methods
  config.before { FileUtils.mkdir_p(TMPDIR) }
  config.mock_with :rspec
end
