require "methadone"

module Howami
  class Configuration
    include Methadone::CLILogging

    # def initialize
    # end

    def self.has_valid_credentials?
    end

    def self.store_credentials
    end

    def self.get_credentials
    end
    
    protected
    def self.has_stored_credentials?
    end

  end
end