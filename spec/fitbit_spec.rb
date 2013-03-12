require 'spec_helper'
include Howami

describe Fitbit, :vcr => { :cassette_name => "fitbit", :record => :new_episodes } do
  #use a vcr cassette so we can assume a full populated and authenticated user record

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
        @fb.weight_str.should match(/Current weight:\t\d\d\d\.\d pounds/)
      end
      it "returns a nice error message if there is no weight from past week" do
        @fb.instance_variable_set("@weights",[])
        @fb.weight_str.should match(/No weight data recorded in past 7 days./)
      end
      it "adds an indicator if measurement is more than 24hrs old"
    end
    describe "#fat_str" do
      it "returns a nicely formatted string with the current body fat" do
        @fb.fat_str.should match(/Body fat:\t\d\d\.\d\d %/)
      end
      it "returns a nice error message if there is no body fat measurement from past week" do
        @fb.instance_variable_set("@fats",[])
        @fb.fat_str.should match(/No body fat data recorded in past 7 days./)
      end
    end
    describe "#sleep_str"
  end

end
