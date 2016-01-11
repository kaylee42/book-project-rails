class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(amount: params[:rating], user_id: current_user.id, book_id: params[:book_id])
    @rating.save
    redirect_to Book.find(params[:book_id]), notice: "Rating successful!"
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(amount: params[:rating][:amount])
    redirect_to @rating.book
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to books_path, notice: "Rating successfully deleted."
  end

end
