require "rails_helper"

RSpec.describe SearchesController, :type => :controller do
  new_search = {
    audio_url: "www.url.com",
    places: [
      {
        phone_number: "17078496085",
        place_id: "skjhsk"
      },
      {
        phone_number: "17078496085",
        place_id: "sst9s9"
      }
    ]
  }
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      post :create, new_search
      puts response.body
    end
  end
end
