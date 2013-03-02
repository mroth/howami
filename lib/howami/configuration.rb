require "methadone"

module Howami
  class Configuration
    include Methadone::CLILogging

    XDG_CONFIG_HOME = ENV['XDG_CONFIG_HOME'] || File.join(ENV['HOME'], '.config')
    CREDENTIALS_STORE = File.join( XDG_CONFIG_HOME, "howami", "credentials.yml")

    # def initialize
    # end

    def self.has_valid_credentials?
      self.has_stored_credentials?
    end

    def self.store_credentials(user_token, user_secret)
      #create proper XDG directory if doesn't exist
      FileUtils.mkdir_p( File.dirname(CREDENTIALS_STORE) )

      #store
      File.open(CREDENTIALS_STORE, 'w') do |f|
        f.puts({ :user_token => user_token, :user_secret => user_secret }.to_yaml)
      end
    end

    def self.get_credentials
      return nil if not self.has_stored_credentials?
      YAML.load_file(CREDENTIALS_STORE)
    end

    protected
    def self.has_stored_credentials?
      File.exist? CREDENTIALS_STORE
    end

  end
end