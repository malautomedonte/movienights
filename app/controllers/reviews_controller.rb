class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.save
      redirect_to movie_path(@movie)
    else
      flash[:alert] = "Something went wrong."
      redirect_to movie_path(@movie)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
