require 'rspec'
require 'howami'
# require 'vcr'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
  # config.treat_symbols_as_metadata_keys_with_true_values = true
end

# VCR.configure do |c|
#   c.cassette_library_dir = 'spec/cassettes'
#   c.hook_into :webmock
#   c.configure_rspec_metadata!
# end
