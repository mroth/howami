require 'spec_helper'
include Howami

describe Authentication do

  it "should be true" do
    true.should be_true
  end

  describe ".new" do
    it "should be instantiated with any args" do
      lambda { Authentication.new() }.should_not raise_error
      lambda { Authentication.new( "moo ") }.should raise_error(ArgumentError)
    end
  end

end
