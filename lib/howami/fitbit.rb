require "methadone"

module Howami
  class Fitbit
    include Methadone::CLILogging

    attr_reader :client

    def initialize
      @client = Authentication.authenticated_client
      retrieve_values!
    end

    def retrieve_values!
      @weights    = @client.data_by_time_range('/body/log/weight', {:base_date => Date.today.to_s, :period => '1w'})['weight']
      @fats       = @client.data_by_time_range('/body/log/fat', {:base_date => Date.today.to_s, :period => '1w'})['fat']
      @sleeps     = @client.sleep_on_date('today')
      @activities = @client.activities_on_date('today')
      @weight_lbl = weight_lbl_value_187_workaround
    end

    # this method breaks the fitgem gem in ruby 1.8.7, so we just work around it and dont
    # offer any i18n support for default units in 1.8.7, just assume AMERICA FUCK YEAH
    def weight_lbl_value_187_workaround
      return "pounds" if RUBY_VERSION =~ /^1\.8/
      @client.label_for_measurement(:weight)
    end

    def weight_str
      if @weights.last
        return "#{@weights.last['weight']} #{@weight_lbl}"
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

    def steps
      @activities['summary']['steps']
    end

    def steps_str
      "#{self.steps} steps"
    end

  end
end
