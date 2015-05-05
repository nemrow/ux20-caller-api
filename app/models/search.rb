class Search < ActiveRecord::Base
  has_many :places

  before_create :create_sha

  def create_sha
    self.sha = SecureRandom.hex[1,5]
  end

  def to_json(options={})
    data = {
      search: self,
      places: self.places.where.not(response: nil),
      complete: self.complete?
    }
    data.to_json
  end

  def complete?
    places.where(complete: nil).empty?
  end
end
