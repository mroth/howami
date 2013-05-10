require 'howami'

Given(/^howami is not authenticated$/) do
  CREDENTIALS_STORE = Howami::Configuration::CREDENTIALS_STORE
  FileUtils.rm CREDENTIALS_STORE if File.exist? CREDENTIALS_STORE
end
