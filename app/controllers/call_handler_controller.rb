require "uri"
require "net/http"

class CallHandlerController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :xml

  def test
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
    search = SearchHelper.new(new_search).run
    render json: {search_sha: search.sha}
  end

  def status_callback
    place = Place.find_by(sha: params[:place_sha])
    if params[:AnsweredBy] != "human"
      place.update(complete: true)
    end
    render nothing: true
  end

  def init_call
    place = Place.find_by(sha: params[:place_sha])
    xml_data = TwilioXmlBuilder.new(place).init_call
    render xml: xml_data.to_xml
  end

  def goodbye_callback
    place = Place.find_by(sha: params[:place_sha])
    xml_data = TwilioXmlBuilder.new(place).goodbye
    render xml: xml_data.to_xml
  end

  def trascribe_callback
    place = Place.find_by(sha: params[:place_sha])
    place.update(
      response: params[:TranscriptionText],
      complete: true
    )
    render nothing: true
  end
end
