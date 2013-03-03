require 'spec_helper'
include Howami

describe Authentication do

  describe ".new" do
    it "should be instantiated with any args" do
      lambda { Authentication.new() }.should_not raise_error
      lambda { Authentication.new( "moo ") }.should raise_error(ArgumentError)
    end
  end

  describe ".authenticated_client" do
    it "should return a working fitgem client ready for action"
    it "should throw an error if proper credentials arent stored"
  end

end
