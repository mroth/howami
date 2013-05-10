require 'rspec'
require 'howami'
require 'vcr'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
  # config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :none, :match_requests_on => [:method, :uri] }
  c.filter_sensitive_data('<OAUTH_AUTH_HEADER>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end

def wipe_credentials!
  cred_store = Howami::Configuration::CREDENTIALS_STORE
  FileUtils.rm cred_store if File.exist? cred_store
end
