require "howami/version"
require "howami/configuration"
require "howami/credentials"
require "howami/authentication"
require "howami/fitbit"

module Howami
  # Your code goes here...
  def self.cli_run!(fit_obj)
    puts "Current weight: #{fit_obj.weight_str} (#{fit_obj.fat_str} body fat)"
    puts "Sleep last night: #{fit_obj.sleep_str}"
  end
end
