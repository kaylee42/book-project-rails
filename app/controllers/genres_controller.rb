class GenresController < ApplicationController
  def index
    @genres = Genre.all.sort_by {|genre| genre.name}
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
