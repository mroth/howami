require 'howami'

Given(/^howami is not authenticated$/) do
  XDG_CONFIG_HOME = ENV['XDG_CONFIG_HOME'] || File.join(ENV['HOME'], '.config')
  CREDENTIALS_STORE = File.join( XDG_CONFIG_HOME, "howami", "credentials.yml")
  FileUtils.rm CREDENTIALS_STORE if File.exist? CREDENTIALS_STORE
end
