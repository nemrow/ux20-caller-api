class SearchesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    search = SearchHelper.new(new_search_params).run
    render json: {search_sha: search.sha}
  end

  def show
    search = Search.find_by(sha: params[:search_sha])
    render json: search
  end

  def new_search_params
    params.permit(:search, :audio_url, {:places => [:phone_number, :place_id]})
  end
end
