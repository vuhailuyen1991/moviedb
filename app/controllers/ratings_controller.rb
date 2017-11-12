class RatingsController < ApplicationController
  before_action :retrieve_movie, only: %i[create]

  def create
    authorize @movie, :rate?
    rate_movie
    respond_to do |format|
      format.js
    end
  end

  private
  def rate_movie
    rating = Rating.find_by(:movie_id => @movie.id, :user_id => current_user.id)
    if rating
      rating.update(:rate => params[:rate])
    else
      Rating.create(:movie_id => @movie.id, :user_id => current_user.id, :rate => params[:rate])
    end
  end

  def movie_param_name
    :movie_id
  end
end
