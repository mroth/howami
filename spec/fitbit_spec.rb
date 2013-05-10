require 'spec_helper'
include Howami

describe Fitbit, :vcr => { :cassette_name => "fitbit" } do
  #use a vcr cassette so we can assume a full populated and authenticated user record

  # for testing on machines that dont have a valid condif (e.g. travis-ci)
  # generate an invalid configuration and let us rely upon the VCR cassettes
  # we don't use fakefs with this because it seems to screw up VCR
  before(:all) do
    if !File.exist? Howami::Configuration::CREDENTIALS_STORE
      Configuration.store_credentials( 'abc', 'xyz' )
      FAKED_CONFIG_LOL = true
    end
  end
  after(:all) do
    FileUtils.rm Howami::Configuration::CREDENTIALS_STORE if FAKED_CONFIG_LOL
  end

  describe ".new" do
    it "should be instantiated without any args" do
      lambda { Fitbit.new() }.should_not raise_error
      lambda { Fitbit.new( "moo ") }.should raise_error(ArgumentError)
    end

    it "should retrieve all the values it needs on instantiation"
  end

  context "output rendering" do
    before(:each) { @fb = Fitbit.new }

    describe "#weight_str" do
      it "returns a nicely formatted string with the proper weight" do
        @fb.weight_str.should match(/\d\d\d\.\d pounds/)
      end
      it "returns a nice error message if there is no weight from past week" do
        @fb.instance_variable_set("@weights",[])
        @fb.weight_str.should match(/No weight data recorded in past 7 days./)
      end
      it "adds an indicator if measurement is more than 24hrs old"
    end
    describe "#fat_str" do
      it "returns a nicely formatted string with the current body fat" do
        @fb.fat_str.should match(/\d\d\.\d\d %/)
      end
      it "returns a nice error message if there is no body fat measurement from past week" do
        @fb.instance_variable_set("@fats",[])
        @fb.fat_str.should match(/No body fat data recorded in past 7 days./)
      end
    end

    describe "#sleep_str" do
      it "returns a nicely formatted string with the previous nights sleep" do
        @fb.sleep_str.should match(/\d hours, \d+ min./)
      end
      it "returns a nice error message if there is no sleep data for day" do
        @fb.instance_variable_set("@sleeps", {"sleep"=>[], "summary"=>{"totalMinutesAsleep"=>0, "totalSleepRecords"=>0, "totalTimeInBed"=>0}} )
        @fb.sleep_str.should match(/no sleep data./)
      end
    end

    describe "#steps" do
      it "returns the amount of steps that day as an integer" do
        @fb.steps.should be_kind_of(Integer)
      end
    end

    describe "#steps_str" do
      it "returns a nicely formatted string with the current amount of daily steps" do
        @fb.steps_str.should match(/\d+ steps/)
      end
    end

  end

end
