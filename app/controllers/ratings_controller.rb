class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(amount: params[:rating], user_id: current_user.id, book_id: params[:book_id])
    @rating.save
    redirect_to Book.find(params[:book_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
