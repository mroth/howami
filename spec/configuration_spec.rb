require 'spec_helper'
require 'fakefs/safe'
include Howami

describe Configuration do

  before(:each) do
    FakeFS.activate!
  end
  after(:each) do
    FakeFS::FileSystem.clear
    FakeFS::deactivate!
  end

  describe ".has_valid_credentials?" do
    it "should return false when no tokens are stored" do
      wipe_credentials!
      Configuration.has_valid_credentials?.should be_false
    end
    it "should return false if tokens are invalid"
    it "should return true if stored tokens are valid"
  end

  describe ".get_credentials" do
    it "should return the credentials" do
      Configuration.store_credentials( 'aaa', 'bbb' )
      Configuration.get_credentials().should_not be(nil)
    end
    it "should not throw an exception if no credentials are stored in fs" do
      lambda { Configuration.get_credentials() }.should_not raise_error(Errno::ENOENT)
    end
    it "should return nil if no credentials are stored in fs" do
      Configuration.get_credentials().should be(nil)
    end
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
    it "should overwrite credentials if stored a second time" do
      Configuration.store_credentials( 'aaa', 'aaa' )
      Configuration.store_credentials( 'bbb', 'bbb' )
      Configuration.get_credentials()[:user_token].should eq 'bbb'
      Configuration.get_credentials()[:user_secret].should eq 'bbb'
    end
  end

end
