require 'rails_helper'

RSpec.describe CallHandlerController, type: :controller do
  describe "POST #init_call" do
    before(:each) do
      @search = Search.create(recording_url: "www.audio.com")
      @place = Place.create
      @search.places << @place
    end

    it "responds successfully with an HTTP 200 status code" do
      post :init_call, {place_sha: @place.sha}
      puts response.body
    end
  end
end
