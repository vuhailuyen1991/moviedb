class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  protected
  def retrieve_movie
    @movie = Movie.find(params[movie_param_name])
  rescue ActiveRecord::RecordNotFound
    redirect_to movies_path
  end
end
