require "methadone"
require "fitgem"
# require "credentials"

module Howami
  class Authentication
    include Methadone::CLILogging

    def initialize
      @client = Fitgem::Client.new({:consumer_key => CONSUMER_KEY, :consumer_secret => CONSUMER_SECRET})
      # fetch_request_token!
    end

    def fetch_request_token!
      @request_token = @client.request_token
    end

    def do_interactive_auth
      fetch_request_token!
      
      auth_url = "http://www.fitbit.com/oauth/authorize?oauth_token=#{@request_token.token}"
      puts "Go to #{auth_url} and then enter the verifier code below and hit Enter"
      verifier = gets.chomp
      debug "Parsed user verifier as: #{verifier}"

      access_token = self.get_access_token_with_verifier(verifier)
      # puts "Verifier was: "+verifier
      puts "Token is:    "+access_token.token
      puts "Secret is:   "+access_token.secret
    end

    def get_access_token_with_verifier(verifier)
      @client.authorize(@request_token.token, @request_token.secret, { :oauth_verifier => verifier })
    end

  end
end