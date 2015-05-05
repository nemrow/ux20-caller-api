class InitCallWorker
  include Sidekiq::Worker
  def perform(place_id)
    place = Place.find(place_id)
    place.place_call
  end
end
