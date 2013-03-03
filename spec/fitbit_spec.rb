require 'spec_helper'
include Howami

describe Fitbit, :vcr do

  describe ".new" do
    it "should be instantiated without any args" do
      lambda { Authentication.new() }.should_not raise_error
      lambda { Authentication.new( "moo ") }.should raise_error(ArgumentError)
    end

    it "should retrieve all the values it needs on instantiation"
  end

  describe "#weight_str" do
    it "returns a nicely formatted string with the proper weight" do
      Fitbit.new.weight_str.should match(/Current weight:/)
    end
    it "returns a nice error message if there is no weight from past week"
  end
  describe "#fat_str"
  describe "#sleep_str"

end
