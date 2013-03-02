require 'spec_helper'
require "fakefs"
include Howami

describe Configuration do

  describe ".has_valid_credentials?" do
    it "should return false when no tokens are stored"
    it "should return false if tokens are invalid"
    it "should return true if stored tokens are valid"
  end

  describe ".get_credentials" do
    it "should return the credentials"
    it "should throw an exception if credentials are not stored"
  end

  describe ".store_credentials" do
    it "should require credentials to be passed" do
      lambda { Configuration.store_credentials() }.should raise_error(ArgumentError)
    end
    it "should verify the credentials passed are of proper format"
    it "should store the credentials to a file" do
      File.exist?(Configuration::CREDENTIALS_STORE).should be_false
      Configuration.store_credentials( 'aaa', 'bbb' )
      File.exist?(Configuration::CREDENTIALS_STORE).should be_true
    end
    it "should persist the credentials in a way that they match upon retrieval" do
      Configuration.store_credentials( 'aaa', 'bbb' )
      Configuration.get_credentials()[:user_token].should eq 'aaa'
      Configuration.get_credentials()[:user_secret].should eq 'bbb'
    end
  end

end
