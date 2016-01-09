class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  end

  def search
    search_term = params[:keyword]
    books = Book.where(name: search_term)
    if books.length == 1
      redirect_to books.first
    elsif books.length != 0
      @books = books.sort_by {|book| book.author.name}
    else
      @books = Search.for(search_term)
    end
  end
end
