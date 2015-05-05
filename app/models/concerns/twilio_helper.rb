class TwilioHelper
  def initialize
    @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
  end

  def place_call(place)
    @client.calls.create(
      from: from_number,
      to: place.phone_number,
      if_machine: "Hangup",
      status_callback: "#{ENV['BASE_URL']}/status_callback?place_sha=#{place.sha}",
      url: "#{ENV['BASE_URL']}/init_call?place_sha=#{place.sha}"
    )
  end

  private

  def test_from_number
    "+15005550006"
  end

  def from_number
    Rails.env.test? ? test_from_number : "+14157636769"
  end
end
