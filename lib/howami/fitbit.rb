require "methadone"

module Howami
  class Fitbit
    include Methadone::CLILogging

    def initialize
      @client = Authentication.authenticated_client
      retrieve_values!
    end

    def retrieve_values!
      @weights = @client.data_by_time_range('/body/log/weight', {:base_date => Date.today.to_s, :period => '1w'})['weight']
      @fats = @client.data_by_time_range('/body/log/fat', {:base_date => Date.today.to_s, :period => '1w'})['fat']
      @sleeps = @client.sleep_on_date('today')
    end

    def weight_str
      if @weights.last
        return "Current weight:\t#{@weights.last['weight']} #{@client.label_for_measurement(:weight)}"
      else
        return "* No weight data recorded in past 7 days."
      end
    end

  end
end