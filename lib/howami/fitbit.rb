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
      @fats    = @client.data_by_time_range('/body/log/fat', {:base_date => Date.today.to_s, :period => '1w'})['fat']
      @sleeps  = @client.sleep_on_date('today')
    end

    def weight_str
      if @weights.last
        return "#{@weights.last['weight']} #{@client.label_for_measurement(:weight)}"
      else
        return "* No weight data recorded in past 7 days."
      end
    end

    def fat_str
      if @fats.last
        return "#{@fats.last['fat']} %"
      else
        return "* No body fat data recorded in past 7 days."
      end
    end

    def sleep_str
      return "no sleep data." if @sleeps['sleep'].count == 0

      sleep_total_min = @sleeps['summary']['totalMinutesAsleep'].to_i
      sleep_hours = sleep_total_min / 60
      sleep_remainder_min = sleep_total_min % 60
      return "#{sleep_hours} hours, #{sleep_remainder_min} min."
    end

  end
end
