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
  c.default_cassette_options = { :record => :none, :match_requests_on => [:method, :host, :path_filter_date] }
  c.filter_sensitive_data('<OAUTH_AUTH_HEADER>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
  c.register_request_matcher :path_filter_date do |r1,r2|
    DATE_FILTER = /\d{4}-\d{2}-\d{2}/
    URI(r1.uri).path.gsub(DATE_FILTER, '<DATE>') == URI(r2.uri).path.gsub(DATE_FILTER, '<DATE>')
  end
end

def wipe_credentials!
  cred_store = Howami::Configuration::CREDENTIALS_STORE
  FileUtils.rm cred_store if File.exist? cred_store
end
