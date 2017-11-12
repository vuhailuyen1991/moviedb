class HomeController < ApplicationController
  def index
    @categories = Category.all
    @movies = Movie.order(:title).paginate(:page => params[:page] || 1, :per_page => 10)
    @movies = @movies.full_text_search(params[:searching_text]) if params[:searching_text].present?
    @movies = @movies.by_category(params[:category]) if params[:category].present?
    @movies = @movies.by_rating(params[:rating]) if params[:rating].present? and params[:rating].to_i > 0
  end
end
