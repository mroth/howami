require 'spec_helper'
require 'fakefs/safe'
include Howami

describe Authentication do

  describe ".new" do
    it "should be instantiated with any args" do
      lambda { Authentication.new() }.should_not raise_error
      lambda { Authentication.new( "moo ") }.should raise_error(ArgumentError)
    end
  end

  describe ".authenticated_client" do
    # it "should return a working fitgem client ready for action" √
    it "should throw an error if proper credentials arent stored" do
      FakeFS.activate!
      wipe_credentials!

      lambda { Authentication.authenticated_client }.should raise_error

      FakeFS::FileSystem.clear
      FakeFS::deactivate!
    end
  end

end
