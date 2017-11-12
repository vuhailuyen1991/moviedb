class MoviesController < ApplicationController
  before_action :retrieve_movie, only: %i[show edit update delete destroy]

  def index
    redirect_to root_path
  end

  def show
  end

  def new
    @movie = Movie.new
    authorize @movie, :create?
  end

  def create
    @movie = Movie.new(movie_params.merge(:user_id => current_user.id))
    authorize @movie, :create?

    if @movie.save
      redirect_to @movie
    else
      flash.now[:alert] = 'Could not create movie. Please try again.'
      render 'new'
    end
  end

  def update
    authorize @movie, :update?

    if @movie.update(movie_params)
      redirect_to @movie
    else
      flash.now[:alert] = 'Could not update movie. Please try again.'
      render 'edit'
    end
  end

  def edit
    authorize @movie, :update?
  end

  def destroy
    authorize @movie, :destroy?
    @movie.destroy
    redirect_to root_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :text, :category_id)
  end

  def movie_param_name
    :id
  end
end
