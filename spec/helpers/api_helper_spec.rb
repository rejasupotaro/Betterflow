require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include ApiHelper

describe ApiHelper do
  context "Request itunes server for get track json" do
    describe "ApiHelper#valid_json" do
      it "json has artistName, trackName, trackViewUrl, previewUrl, artworkUrl100, releaseDate" do
        test_json = Hash[
          'artistName' => 'Lady Gaga',
          'trackName' => 'Test Song',
          'trackViewUrl' => 'http://localhost/trackview',
          'previewUrl' => 'http://localhost/preview',
          'artworkUrl100' => 'http://localhost/artwork',
          'releaseDate' => '2012/12/24'
        ]
        valid_json?(test_json).should eq true
      end
      it "json is invalid format" do
        test_json = Hash[
          'artistName' => 'Lady Gaga',
          'trackName' => 'Test Song',
          'trackViewUrl' => 'http://localhost/trackview',
          'previewUrl' => 'http://localhost/preview',
          'artworkUrl100' => 'http://localhost/artwork',
        ]
        valid_json?(test_json).should eq false
      end
      it "Returns false if arg is empty" do
        valid_json?("").should eq false
      end
    end
  end
end
