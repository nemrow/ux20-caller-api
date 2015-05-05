class SearchHelper
  def initialize(params)
    @params = params
  end

  def run
    places.each do |place_data|
      place = Place.create(place_data)
      InitCallWorker.perform_async(place.id)
      search.places << place
    end
    search
  end

  private

  def search
    @search ||= Search.create
  end

  def create_sha
    SecureRandom.hex[1,5]
  end

  def audio_url
    @params[:audio_url]
  end

  def places
    @params[:places]
  end
end
