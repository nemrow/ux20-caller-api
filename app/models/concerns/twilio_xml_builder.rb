class TwilioXmlBuilder
  def initialize(place)
    @place = place
  end

  def init_call
    Twilio::TwiML::Response.new do |r|
      r.Play test_recording_url
      r.Record transcribe: true,
        timeout: "3",
        playBeep: false,
        transcribeCallback: trascribe_callback,
        action: goodbye_callback
      r.Hangup
    end
  end

  def goodbye
    Twilio::TwiML::Response.new do |r|
      r.Say "Thank you.", voice: 'alice'
      r.Hangup
    end
  end

  private

  def search
    @search ||= @place.search
  end

  def goodbye_callback
    "#{ENV['BASE_URL']}/goodbye_callback?place_sha=#{@place.sha}"
  end

  def trascribe_callback
    "#{ENV['BASE_URL']}/trascribe_callback?place_sha=#{@place.sha}"
  end

  def test_recording_url
    "https://s3-us-west-2.amazonaws.com/find-it/Voice%2B012_Voice%2B012_generic.mp3"
  end

  def recording_url
    search.recording_url
  end
end
