require 'spec_helper'
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
    it "should require credentials to be passed"
    it "should verify the credentials passed are of proper format"
    it "should store the credentials to a file"
    it "should persist the credentials in a way that they match upon retrieval"
  end

end
