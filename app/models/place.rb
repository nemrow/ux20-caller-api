class Place < ActiveRecord::Base
  belongs_to :search

  before_create :create_sha

  def place_call
    TwilioHelper.new.place_call(self)
  end

  def create_sha
    self.sha = SecureRandom.hex[1,5]
  end
end
