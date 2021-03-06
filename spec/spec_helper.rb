require 'rubygems'
require 'bundler'
require 'spork'

Spork.prefork do
  require 'rspec'
  require 'pp'
  Dir[File.join(File.expand_path("../../spec/support/**/*.rb", __FILE__))].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :rspec
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true
  end
end

Spork.each_run do
  require 'switch'
end
