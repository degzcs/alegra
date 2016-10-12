$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'alegra'
Dir[File.join('./lib/alegra/**/*.rb')].each { |f| require f }
Dir[File.join('./spec/support/**/*.rb')].each { |f| require f }
require 'rspec'
require 'pry'

require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/cassettes"
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.include JsonReponses
end
